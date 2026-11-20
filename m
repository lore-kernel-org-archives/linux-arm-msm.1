Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182244;
	b=MtmTZafWHC+cNrui1f/554bdHgdJMHcQRCDfypuGWHfLJwwxe/O9EQyBadii2HUYW5ur
	 zBZ34T2Og/Tg9dypk5GBFPIjhOVqE5iZalt+S4f2PW2O9hCC2CXIIaLSo5968WCwpQqYh
	 eaeeZR4f3y3m1ktxdEL0HmgSL9jJMz/lNbyaUEotRAjkgVTvmmtCcD6T8sTUi1FflgESK
	 Q8DGxnreEYdeEJ0zYFR2ewk4zDqRhWCLfqGwzoEy+TkotKfF5HGnx6aAHveP2qlkrEcw6
	 Ew933RzmWWqAerLao6Dwg+O8snNMojornAjQh0fBvglGIRJ5bSlLKV0+SPwJYeedc3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182244;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=aWLejDBY6cxKAWalyM4UrAn1z5uDI+O1UHK3W8xEzBI=;
	b=gj7THAfpWAKzMCrpotj7o8Mq55u0jI/cL9hjYimnAk0N/jotxRNkWGQGYGxJhZZTnWsc
	 Xzwh8EucyrKlrLlm6X2MPstlCXX0YEY+etMHwi1fWIGfqTau160CNrFpLYOUJo9ql0HjO
	 XbgElxBlj5hmIZ1vz7fmwrqmRVXaKDfocmOhbtwhj1EXpEpwsLZvUFfrbrB9kM30qAbYA
	 wgmhA4fpcdJqsLuDblq+bO9T1qBpF79T8kPIzc9T/t2X0GYL8g2YMQDWZK4+i+cKJL72j
	 r9NsWHaSusRYYbya9QZAfIzKCOOZU96hgPr2JK5JbnoZBEF3h6+Gb4xdW3IadlGpnGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h8lmYrck;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vx70um7f;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7C060A2634
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:44:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA7C060A2634
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h8lmYrck;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vx70um7f
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk1ii2433127
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:44:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aWLejDBY6cxKAWalyM4UrAn1z5uDI+O1UHK3W8xEzBI=; b=h8lmYrckPdPOTE9c
	zBfMzDPhb09b77c+f7yC++L5R671ZuqDB4ARr8QmZkVWngg8rVQozVA5dAT3uwMv
	DeCalnH3oHpSn/4mMtGROnCaGRRte5JmgxEh9tBuWB3fpmh9OmhYJncenlOWJS5E
	nqh5ZTC+V9bv5AfI119C5acSzsYxl3n8GU+fZDBPKB4JMtNxusRxFnD1MxlrSC1Z
	VYJ9wu9fcadHw/OusG/AhSdbWLb/tdl7JFVZ3Yn5IanRMQ+MZqyxIqWwMK3bU7LZ
	m1+mSlPSPFfVi1VUwXXkwVx+E2Wm3BtbjC6MQnUEmULsvha24zyvKq0IEt+p4uAK
	yS/U6g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjja1sw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:44:03 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-370230d93efso2856998eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 05:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182242; x=1795787042; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aWLejDBY6cxKAWalyM4UrAn1z5uDI+O1UHK3W8xEzBI=;
        b=Vx70um7f0J0eyXpM+/rcbMyho5v/zaRarIUVoYd2Mex+/5bcC8u3tJQlfcBQ0+ePhy
         ZP+db2jL61voc0tie808NH2gFchKQsYIk4ylFxKsikk46dFESVSTpjFKke0fgZLcMEKf
         Taj3YbpWseRziy+xw7a+PsRu9WWmvYFpp+7+Ro7n5biYJGe9Hy9MtWZ26XaJcXzJURuH
         OOWlUt8JL74GNOzDJD7vBsVRQLnKSbGZDQuUrjQMc0oYssq8aHzLNw/GRmNfjpelcEO0
         z4idJ9IBqjEEfKa+iea7D3PBmfGdg9CLUDSjK8ezvznEArB9uS8JrRxIiCnMtnEYDvrc
         YjPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182242; x=1795787042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aWLejDBY6cxKAWalyM4UrAn1z5uDI+O1UHK3W8xEzBI=;
        b=WO7voM2RcBDIChAnzVJqsFsqN06CewRC9cWWM/dgJpxmnE46mSuGAqPsN7VqAikqea
         l38tjOPLL6OwL6LhwzNuAWEU0hTliUYnTxXAa5lcH5YZPOBrt2QyNFAWgL2EDIfBoXvF
         dxA6vxW7HvvY8G7nUCsv/pgdT+LgCVzW9kGb/++bcDgSKK+r6wTxr7vegBbpvHLY0bl0
         pRb8SQtI7deKlGJoRBhWV87CQu1ZAB2qkzepGWtI12s/3IlFXpqb5aBXTb1DqnU6TcHf
         hNq3NBWfhNsNNWOiQnD+LJWCFh5e2Z7BpSynfl7Oi+xTbybKhYdG0EKJRxpD5eiiiJvH
         T3lg==
X-Forwarded-Encrypted: i=1; AL+hErEdOwcZqHMxRDDkYkJvFR0bnSyR4U/rkgObWBkn4i0kajdYC0flrXWY05D7umhonY20bUjadWhlvElt7+gD@vger.kernel.org
X-Gm-Message-State: APuU4Z+LaRrAL34sOEsgmVn8Yi6UtdNVrFMZX4AbCos3cLT4Xbwvc5/l
	aw8AxUfP/qUQhhVoIDAF9Hkss/yPe0ZSw+QkwSFfjtHQPCAJ9EPbduAfSSAG25K/H5iV3+rYd9a
	wytBOqRPMyYvvuRDz0DwOwWll69uZ2JskPYvVe7eE0/peM+0NHA7KDeLDCD9NqFegKBkvMqMb2e
	CX
X-Gm-Gg: AZFdTZd3lAtPVXs7jHDyY84rDlmnKB4fg6uFN7ogjqPnzWZfXAnVKD0jFGp4iX3gZdb
	UXcYqWEwcKk+5Gopd+mID3Q0+C/S7uAO/dATeQGOixoSU14ErZbvniJ+5BwqsFA6TSAXnsHWnR+
	ARLDBpwq6knjNQoVLBlIJzeHgCr4CvsNqRWXV943X0zxMTAEuJKBH9M6z/A9Th1or36oUBhYgUi
	6Zq7qc4RCMiNF8tYQ4gPjKdfGFSdd+ulTDgeBmpXOjlFzS9A1RglOhVo7SAQBWJNwr3NhzX09Kn
	PGqcAP/pukD0e1yZ5GuFNY5F5FiS3NLIWrdtr/DNahUfkkRYMZzNErfkO3rKE3e5ymoY8tyHo1V
	CHsxeEr7mphv7KPB3mL9u7NV90NZbnI4azqiV5jmMPXJJGq3iAaNyVCga7Cyz80N7wOB3fin/U0
	OSDBY=
X-Received: by 2002:a05:693c:87d3:20b0:382:8358:9e03 with SMTP id 5a478bee46e88-3856ef457c4mr3214235eec.17.1795182242312;
        Fri, 20 Nov 2026 05:44:02 -0800 (PST)
X-Received: by 2002:a05:693c:87d3:20b0:382:8358:9e03 with SMTP id 5a478bee46e88-3856ef457c4mr3214196eec.17.1795182241665;
        Fri, 20 Nov 2026 05:44:01 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:44:01 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:49 +0530
Subject: [PATCH RESEND v4 18/20] arm64: dts: qcom: milos: Add GEM_NOC
 interconnect for adreno SMMU
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-smmu_interconnect_addition-v4-18-be30526391d9@oss.qualcomm.com>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
In-Reply-To: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1035;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=uW8nrRF4SJLtr5/e82lnBVVXICez3ZPhzw4syEcDxKA=;
 b=ruBw4Imxa59bxECtm9BfDnEQ/DhLV5sEaxl2SqHiR8757X6GkqgD6J2x9UuFHUZeWElYLwbS1
 eSMtXQ8gr56A+YS8LcG974uxZbhOFOHcVO3rJlm/kmCKVRbZFPz+WnV
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Authority-Analysis: v=2.4 cv=FJaOVOos c=1 sm=1 tr=0 ts=6b004ea3 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=iSr-qRAn3DWi8jR0IaQA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX3ElDXPHW2I4m
 yui2wwyZ2Y4RRW3xt7L0r9XRCooqr5NeJWCJQ2cbdmHNWIveK0CVv3ARCfUdCxxmTgjbHzJ5iWs
 hYjmW4h1pBMH9BmZ4g7ohG+8tZFM7PQ=
X-Proofpoint-ORIG-GUID: 7-org4vM1OQx5UoMufVjdL8ijpFMrmiR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX+l53fUTCZgQZ
 ppqdITYH9UBk7tnJb6/UJDVIvWmabXvfLGXciapE6Fo/UY3IvSr7hqcuWuTeZoVkbDwfcBehfbE
 9LFG/kfbGxt0GfzCNokbbezIkMymo0osx5hbgKFjvweDsp1bjJwf7/r0FLCWGD/j6f36O+nXTdw
 chYs8bRaK/G0R6u9IIPyABWg3N+OsI/7Mm6gN1IclEuGuFyt9J2qdECJrTW7F20WoWXujWy3yic
 kE6w1qPanstIr/+FanbSzWUSufvRHLpCRdY+NXyGi8Z6B6KvS2UAoZ5ZwSZxqG/EMJAZHiLo0jA
 J7dvP4K6hBOlMjeYj7vW0nY86z0AEZBmR8qtOEBbUzbL70rZaSC1wAUiVwkD1fYqJRVtBnwrCnH
 A//5jqegwDWQODBqk0GLlGNSycwmRmcNladqJN1xwDpCdFSwSI4Mxtcb0l9ZGMJsFw6x7t20LEY
 ZRQvb0HhYbvwHW+NWwA==
X-Proofpoint-GUID: 7-org4vM1OQx5UoMufVjdL8ijpFMrmiR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200054

On Milos the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 9cae93b6a610..49ea0a8759f3 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1988,6 +1988,8 @@ adreno_smmu: iommu@3da0000 {
 				      "ahb";
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		ipa: ipa@3f40000 {

-- 
2.34.1

