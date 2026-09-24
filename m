Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C0C425898
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 07:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790235193; cv=none; b=I61RdXwex/QDUiQDWgOYyyxUgUBiiZEN4ATroZvu0QK6IzTthH4TQvn94NVe1ALU9LXtwMftNLdZv0/4VY4S+rSn8qSm/cq4kWvCSzmkE8hYBqq/nYHOPP1JWhZA+dNaE6Mtb2BVviMcVqRhNzpkWj+WijhiBBcCBgyE0wAl9Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790235193; c=relaxed/simple;
	bh=4HUozPl6P8WQA6fqZG5KiRI0jrfGMQDXBfRnaSUaukQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Oiv8a2+4Z5pP5ZuDGfWOcL6Ixi1mL7twGsmSnlfd3LlqZj0O4jvX9+3ZvSAKhJpbDL6UtVq8akow66PRyxNAeGFbdG6Y4WGEn8IGrruf1RFFXJG6q+2W5b8XS4AuspAXvUW8Im35OS4SsGrT4O/gKMzyBy8szcSxCKQG7npkeYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cg9m3Cgy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZK4j4+IX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cg9m3Cgy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZK4j4+IX"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5fEl81149716
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 07:33:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2WA7LsDGNuQYaD6cNjqTA1FGgaI7kzn1QW6
	oz4DCzYk=; b=cg9m3Cgyp5c7m5GsozMjxVeHReoL5dYl+zXpL+SoXAqn38fDCPh
	SKro/kMouiBTvCACnWJmSH7VHIxuwn30EKJrvRmrJtH/qVnAgxJ23LAXcax+ltM9
	kfYVoNNraZqaV5WDRv/LAKAwhY07DHqH9Cz1BRUCe8ukNh6eCz9rEF/Oysjyvvkd
	VtxBOaYmtGvfLNAue4MNeu7mOqAKv3FzdNYrQUuqNXAXATvOQ9lp64ES/kX1e2cc
	6hE+poVXlcgTDX5d4LspuU5M2TbGsZjukF5JKBEbRnGTaBFfe3njrSYKA5KZObb4
	pz7tLVz6+TIEZSSghmaGHn22p5lgnIjMJNA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvmrraape-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 07:33:10 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-334f782d1abso1298058eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 00:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790235190; x=1790839990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2WA7LsDGNuQYaD6cNjqTA1FGgaI7kzn1QW6oz4DCzYk=;
        b=ZK4j4+IXs6RCLfEsUU0SxLdFaNGYcfkFZxhmSRKb3hhPnZUn9iQiRl/Yl0frUJAus+
         ZSBv9OP1GdykHiPUIiHXBu+h2vrNS7jHYBwWvw/UCYvAvRXlobNStxN3L3+GwGWEn088
         9sf5WzcyNosM2Itbp/62GSYIUhaJh40ULXgSHgq+Z0xRFhZtq1FtsqRmKbioGAwwWLNd
         JutIvbzp0iOJnSKPyjB5sB5i/Zxa/iVR8O5np/7POrG6XY5k766DSattNYLloxmky7FC
         Z9FY7zwNeQty6ZFuthDC2wxxYtMw6XThX0rUkPMdtogB5RzcfV/5ld12kdUBtkXJ9UcS
         DZjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790235190; x=1790839990;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2WA7LsDGNuQYaD6cNjqTA1FGgaI7kzn1QW6oz4DCzYk=;
        b=GfFMWwj81Mlw2rgmW2UwsTdhU2vRjghfwaW92hS6V5P4fF47EOvfKrYETg5LCh90mT
         5H06UyB51K4HJqeg+DgdXayLnX5YkQiGR8V+azd7sPOmAsalmMNNgv73VIAHFly7M+VH
         KatWT5AYNiDL8yPU23EEp0x1nLeUuEb3ya5otbm59N+f8omeR4Zq0YipZFjQLVpg7GrE
         LEhFpjjFJ/8Jo5mh+sgsI5/sjw+dJjmU1Md2DEFXhHIs+VNLnxWcGlfXPOVbmo8/JD82
         NueSElX8Lt4aqes5dGpUB7UT7QTNzVyFunncBUSYJl9iRdwIR2ftkI+7ZCT0l7Q9MMWY
         XfSA==
X-Forwarded-Encrypted: i=1; AKwUvBwcWkpP5AjdeyVg/4I/jSWyKfzv5cD4mqr388C79zKhqUvMoTBbNimtzqIe4kf6bmP4N9tWJoPANzIxTiQO@vger.kernel.org
X-Gm-Message-State: AFuF++mn0eHbts4Ru7s+eXapEWVANX6lfEkUzJlbCmC0LbSzb8Q96X5+
	ZbGVtDJZC23PrDEYBJ+GEK14NECmTt/zaB9X/THy2Esncs5Svr2sR6QniK7m36rnVYwVmSPi1GS
	z61zrgXQ8MBZWZYYM+YUBqiDX34dN53TW+m7zcKYfQATOxCvo3nGCqDzU5yewNKwJDnDN
X-Gm-Gg: AYBFou0vjTgmtdut2vhc6jcmP8PYGCMna4UvZWuKw79mN4lUg0VuoFBTj1N1zQmXi1X
	PPfpQyLbWvyHCppEOhInA4FGuh9Xt4fGeaOUlOUlj3XRhA5J752JhXaQDrhn3U8dM36bqNkXzCw
	ob0kXZjFfGVi5ZdzRWmRmn53j2QeeyOPUNMzPuPM1c1jqRvbNo57EvP6o5jO8ZjpPYXeO9kjYK1
	s467LkvDGQ13DvN9mOBVemHvsPop+fyc9z7TPRAnpXEGvX661XQDRw6oKKIv/q/Zj9w0CZPcay2
	MK/oaTaljoh8dIu5VMID0V9ZITX5l7atiIuhVxumaQQxwuAjIZ25LkJ8HG45Dz+I970QaS89BA0
	nnMW9cWnfHs2YaA4QuJHl6/xaBYr9+vpRoa0J42JdzeptuL60r4LtCuoWLVs=
X-Received: by 2002:a05:693c:880c:10b0:33b:fc17:e781 with SMTP id 5a478bee46e88-3400697415bmr1260052eec.27.1790235189770;
        Thu, 24 Sep 2026 00:33:09 -0700 (PDT)
X-Received: by 2002:a05:693c:880c:10b0:33b:fc17:e781 with SMTP id 5a478bee46e88-3400697415bmr1260028eec.27.1790235189198;
        Thu, 24 Sep 2026 00:33:09 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e939fe502sm11052635eec.2.2026.09.24.00.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:33:08 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Pushpendra Singh <pussin@qti.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Add BWMON support for Nord SoC
Date: Thu, 24 Sep 2026 15:32:20 +0800
Message-ID: <20260924073222.1000666-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzMSBTYWx0ZWRfXxPB8wIa2irVg
 xascA6psgWEPTrOKdP3yGHhO1cByiMiPOzNiCsN9i5mMAPIvWnjLeSCRetB6q/By7xD6K2DsO6Z
 PNxHg9h//BoKlmYLbpKK7t0OtLc/6GOThqkMtF8GZHiNamBeYDJRHFL14umNr5smHNsMg1p6E5T
 /28Q5Ai0ioKUd5JbIveCwnoUKLMILvnfE45AxWhNc7Io8CzgZEHxMUlWJ7P7ISPeaWE7nZPsKLY
 1+rLWSqKEzlONreCTh7ayJLM10gry3yWVVZ0/B+nI1Fmt+VgH4vZ7QVLkoip5h9hQJuALEBF3EH
 cZhDbdRKxpzJkfyMJug7PlT3n5zdx9ZXhQTGvgcTdORr1PvZQ2PrTb3wfhccjPSqMx4EAs7D6jT
 IReg02qS6f+J6Gbhvbjh5aIbYfKQLqSQDYiSTxiPs8lD5OZVK9bccTpbKQUe3r08m6280uUeLXm
 hHPR33c+eyvVR94UO8Q==
X-Authority-Analysis: v=2.4 cv=TYwDJhQh c=1 sm=1 tr=0 ts=6ab4d236 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=PYu-U4Ynb8dZ3rZs9soA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzMSBTYWx0ZWRfX+oHCyAUDh0RO
 i9qgJlymyvtb7FntH4MYHCHdE2Deh46kB1fnSGxnMLG0oAIg9J8C1fyzLeWFK/sHABeGiYlN9Xr
 g7q5TRNM4ld9cYXfTTIlwc3xGtQhuGQ=
X-Proofpoint-GUID: KL4KsHfVRC4NURzW6S7G5u9bFORgLrxB
X-Proofpoint-ORIG-GUID: KL4KsHfVRC4NURzW6S7G5u9bFORgLrxB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240031

The series adds BWMON support for Nord SoC by documenting the compatible
and adding DTS nodes.

Georgi's Acked-by on the binding suggests that we can apply it via
soc tree.

Changes for v2:
- Fix "reg" length to be 0x500 for all three bwmon nodes (Thanks Konrad!)
- Combine bindging and DTS as one series
- Link to v1:
  https://lore.kernel.org/all/20260831090134.585588-1-zhangfei.gao@oss.qualcomm.com/
  https://lore.kernel.org/all/20260922080416.484280-1-shengchao.guo@oss.qualcomm.com/

Pushpendra Singh (1):
  arm64: dts: qcom: nord: Add bwmon node for Nord

Zhangfei Gao (1):
  dt-bindings: interconnect: qcom-bwmon: add nord cpu-bwmon compatible

 .../interconnect/qcom,msm8998-bwmon.yaml      |  1 +
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi   | 21 ++++++
 arch/arm64/boot/dts/qcom/nord.dtsi            | 67 +++++++++++++++++++
 3 files changed, 89 insertions(+)

-- 
2.43.0

