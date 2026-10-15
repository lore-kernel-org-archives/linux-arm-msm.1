Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD30C49CF26
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 07:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792048530; cv=none; b=M0QvEhCIzkE5M/StVCTcibXw/pe3+XabRKt8R63lfFZ8w2dLRviqElhmahXZLYZt2J9QgiCQO6TiLX4+g/a2APIBDrtx6/lVFfS50FxuyiuWS8v8Y334r7l57gG++BiRGrmUOvCiCH6GT3samkfwpDhoZ0In88wLplOajQxxBhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792048530; c=relaxed/simple;
	bh=2E4LX2gi3ec2r3gAAOo7B3XAFZpCRr918/PUAS/EG/A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=k+BkE8HgesFmKqAk15xb/l9kJS3AjdDa/WxP8dSak88vNrbzdX4jF+m3LQcXTMxMIL/YHYp5GkX80n8JmU0S8O/NGT78JW5VnHIPkFLaBmRSxDcZ5VP2dN28d6isBmDge5yPIFTASxEDc26YkZyKH4JhYGKUPYC6YCWfYamihcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MfjN3JfK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LOmS0/44; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MfjN3JfK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LOmS0/44"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F7ESqM1672554
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 07:15:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=dkV05lHY8j5zFDFFlsxT/n5tHhSQnsjatPl
	OQVWcOZ8=; b=MfjN3JfK73PEQGvN5hZP1ngb5CVdSK+hayCRlmpeSsskoMgE7jp
	7OgXKQBS8jqU9hstk2wWAFEBB+uw4o4psGsW2dhQdbHi5eugcXXnMUozZtLNa28T
	Ne1FjzJ8l0UIq6CKqfIBsKXdiN5xZaAeqES7PYPsXC42kpYRm6QFhh8Moz/UAihG
	LFcj4F1mj9zfw8RE1CCmeXE65TPVKnVkXIep5T0/dzJ2q2CiGDTp6c5TaZWhz5WK
	mZBG/NNUsRiWp9KqTNdNqQeWRJktD4KXMtb+k0oW4nF9WzyYApttq0N6h+rEtcrd
	0CbQCKTIoH1l8db8+N8OcHtU9YmVCqZiEnw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hacrhb2v6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 07:15:19 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d5dbso6031527a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 00:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792048519; x=1792653319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dkV05lHY8j5zFDFFlsxT/n5tHhSQnsjatPlOQVWcOZ8=;
        b=LOmS0/44JR0UGpy3i0qOUCl0YYJzwOO16zEu7XaeUYeCHm77FdFrfpacM/CXWWyyVB
         r3BB5x2iHk17A2juiFeShsfOkbwtiF6wCysv9mXbJAbkaryb2IWu0eX3pBmE2iAQK3qj
         7TnY5tDNpFhP2mfvS1nVTBc11loJpDwYcXIGqQ0C1TSL1cF6fEQqXkGY2C5AYkOp56sN
         NJ2My7o0zs1taWJRDKHip7D7RpAbGkU7NKnUi/5cyfnVz+Tn9LD9bQ/R+icQmE2REcsO
         vnaq5bgVo5RYLsIFztgsH23QRfxbNLYSWBorxxchltiKa1cTp6d8RXKwqfG7hPf47SOA
         OLlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792048519; x=1792653319;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dkV05lHY8j5zFDFFlsxT/n5tHhSQnsjatPlOQVWcOZ8=;
        b=CVTCw22IxW/qzhB2UQMHKYUJVgL1vasGhaKbASkCozd2LRMtvw8DGdisELf2+saqA8
         fU2/t6C6tuqaW3dn30STLWq9/50MUZioNdUVZxBSVzAV6Wt6z2lLgEYlvHaIMiaiwQW2
         1h58JLYLy59SIleJworV0BZulF/g1a7FBgTFB8FevflyscbjYg47uz9C6WY7xLsJvSBO
         mze7ykgyE/MTXfQlFvWrQAHloxGF4bHT1FODg/QQNR/VuoJbeugvM7rgQsPV2F4eXIg6
         3PZa1FVrZsxd6TmloP/ME/bqNqUKwh6t7VNeLdwWJJm7htx4GJPUdhw+T8xJxwkvNpQ1
         +74w==
X-Forwarded-Encrypted: i=1; AKwUvByRgEsjsqC6SvYOWfML/tL1WR6aYS5se99y9UNXet+tbvs8/DJ0jWMoGyBih+0i7RkBR0ONuj3lTBg0nHBs@vger.kernel.org
X-Gm-Message-State: AFq9FYKogMICAlW5DCUJAMoXMD5iOlTJWpwdDbTxBm3mv4qnzGXWyRMm
	beaM1yHBAK3zPQzVB8yzNcMxACO1XAFSHDQWHkMDiLwHLcmNGcZfrGaNOE2ES5IvvsN+d4EeIiO
	D8xcsKcoAMlS7bqRqo/w2BcjjzoOanYZtPoBeNbSBhDlKH6OCz93hvoKqsCCoHF3dmKq/OAR7ti
	vk
X-Gm-Gg: AYBFou1wBQCNPCwcHybXF76U9Ugjcoynv+Sxhko6908k+yF1f1Y5sud5PcaaIYrcL/H
	xB73CicH7qDTvSR2i0IRL3EySdYe+QMVPZRp3LdyzP6/VxixCILVoHYuWOFJ7jW2aL/Jewrml8w
	Fr6wbb8IhEG+gq1nOnVnaXn9shgREm927cbLJw/GLjJejhUV4Fg0/0SlLwX++I3p2juNUzalp+2
	UOyiCs8rMdnUSULKdfPmgTsgq/MLWWcWohU3ngoNIkSM7O2+OoEjcxS0cPcYeMh45TEsoge4usZ
	tfeT+F9GoEdaIQgfQrmDkV+Vke9Q+o+xFAu/balRF4XfuMuLV7ZwIuGCO7wE/HsclJpZjIhlBd2
	PPfNwXyvOSZNVtibX/suXeL3LijfOcuRhHGwj3xWQl2U2vAQUc9UgCrS92YqkRxvqpAl49FAY
X-Received: by 2002:a17:90b:498f:b0:3ab:d26b:c2e9 with SMTP id 98e67ed59e1d1-3abd26bc503mr9600558a91.33.1792048519176;
        Thu, 15 Oct 2026 00:15:19 -0700 (PDT)
X-Received: by 2002:a17:90b:498f:b0:3ab:d26b:c2e9 with SMTP id 98e67ed59e1d1-3abd26bc503mr9600546a91.33.1792048518648;
        Thu, 15 Oct 2026 00:15:18 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac944511c7sm3223475a91.10.2026.10.15.00.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 00:15:18 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Jianping Li <jianping.li@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com
Subject: [PATCH v1 0/4] arm64: dts: qcom: Make ADSP remote heaps no-map
Date: Thu, 15 Oct 2026 15:15:07 +0800
Message-Id: <20261015071511.977-1-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: mSg7l6vAtUP4hMmHo09QkLlYlhho8ppN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfXy5JVVgIE6ziW
 uibHBdCx/fugEWzzo4Jwa6+HJaYzOxHbggUDUm34RT6adZntl6fk+uPfVu5Fi9uDgXJqwPjsoC/
 Bo0mfiw3H5v0Jf1QnZJVnEjamlLlb+Y=
X-Proofpoint-GUID: mSg7l6vAtUP4hMmHo09QkLlYlhho8ppN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfX7b1FDNGWnT9a
 GuJib8SzqoYJnVTLglVROk5Q/PreEJIshWKuYqNQnD66nrh2bBYCytiT5OuZL2gmZipP01DbaGH
 caZMP+3eScPqc9XeqUJWjK7zEDZz00qK8ZlHcEEnkxCPior+gleB8T9xLdZyfBvnCEhB+eoXFnv
 P7QyhDrFzAs1HG7ZvpSRMP7+VepH+ERneiMXKbL8W4X4LIDMlZiKkUI1xiryYEMJ/EuBaDLRpJa
 Z8NQA0rEcOZzyI+H6mXYwGcEGCck1JH3PqIQ9lzbtOP+DTN+GVlW8LLt8jZ6JKZId5Qgghvxnba
 od8ujSs/4wkoiL6go9xb7fqkZMwpu11ipIMev/YhuRIe9zhhDwMh9uVBP/o6nahWbFh1ik3U6eQ
 Wbs6rmJ69FBh4n8EFsxa0haejT82onEzx/Ti9Gc5lALUiCSVT/XkJ9rDsipPoMJMuznzjBsRzGT
 e+WGpytIwTi5y5morDg==
X-Authority-Analysis: v=2.4 cv=SYZi5fRu c=1 sm=1 tr=0 ts=6ad07d87 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=OBlduepgtoGKHnf9jnsA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150028

Several Qualcomm platforms declare the ADSP remote heap as a reusable
shared DMA pool. This allows the kernel to reuse the region for movable
allocations.

When FastRPC assigns the entire region to the DSP without first
allocating its pages from CMA, those pages remain available for HLOS
allocations despite HLOS access permissions having been revoked.
Subsequent kernel accesses can therefore cause synchronous external
aborts.

This issue has been reported on Talos during GPU stress testing and on
Kodiak during storage testing. A further report on a Kodiak-based
Motorola Edge 30 describes similar aborts during everyday use and
indicates that marking the heap no-map resolves the issue.

Following feedback on the Talos patch, this series updates the remaining
identified reusable ADSP remote heaps on Kodiak, Glymur, SM8250 and
SM8750. Each platform is handled in a separate patch to allow independent
review and backporting.

Replace reusable with no-map to prevent normal kernel allocations from
using these regions and exclude them from the kernel's standard memory
mapping. The existing allocation ranges, alignment and sizes are
unchanged.

The Talos fix was submitted separately [1]. Agatti is also excluded
because a separate fix has already been posted [2].

[1] https://lore.kernel.org/all/20261014083820.468-1-jianping.li@oss.qualcomm.com/
[2] https://lore.kernel.org/all/20261001085247.1897991-1-benjamin@wendy.sh/

Jianping Li (4):
  arm64: dts: qcom: kodiak: Make the ADSP remote heap no-map
  arm64: dts: qcom: glymur: Make the ADSP remote heap no-map
  arm64: dts: qcom: sm8250: Make the ADSP remote heap no-map
  arm64: dts: qcom: sm8750: Make the ADSP remote heap no-map

 arch/arm64/boot/dts/qcom/glymur.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.43.0

