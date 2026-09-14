Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FB7412C05
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 08:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789375414; cv=none; b=YF7ZpNsLWDRDyrdQjJPClt0qTS48644YtzULB8Yt7a0KLjfi62bIs/mitrQ3QHpPmGdj9pNnByPWmldN8YH+rxWaYm2k7Uuh8f2jtnbDDiH6rJrGVTOOWCi/Ep6Y9bwF90JCdyinM2cWuOFoELz8wSWNcQAdEVRiD7F8r36yeRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789375414; c=relaxed/simple;
	bh=Fk0V5Gn4W98teq44FLwxwMugmmSjf/92S597f3NtksA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=npuu2uTC8/bTyCsbjUzeAt7FsgeqAkf1oasJbZjIOgjooGlh1RqgnREeZB8cPlNvtZEuhkw3oHtAuwV+WEo1OMz5Cydgfq3iV01hiT59GWPZmJ7oPINM9eRvAKRTxAoo8MX3NgKcqi5NJBg39kWooMu8X/s3BXnMmCOO4NgXo+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eI2hIlcb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iikKn2wK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eI2hIlcb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iikKn2wK"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5inHL4057533
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 08:43:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8lZ79DvWz2Z
	oVyX5nf93rjrFskS3i8nj6FxH0msqvVI=; b=eI2hIlcbUhmuic8oUVgPdkZdBno
	lfC26gBYU4Ua/CPf/gKx+EcLeePTV8TXGRWLnMNBOiRIHe+CqZCSNW2r6g8+HRVP
	Cfh/CksIerDnVpuwEmwy5Ti7TpHuNyvMELSKinJPpKAhQu3H70tswOidzbo9HzyT
	NYkMP8pUadUC3ooPUDW73j07QsAi9iD4WaJtrOB3Bw8HXWw8ZTPM2p39kldzpR7W
	aK3xAIDOqlaGrz0li01dZIHcRRnph5fsVnUToIst36Gfs2Jz7+ehXkeSCYUUOKow
	FqQb/wGc/oSdwCih+6RUGqYRG1pt0fmtfWN41PfrKnYJ7fAxRhuuxhA5KKA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hssk5p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 08:43:28 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3965ba1ba3eso3754619a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 01:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789375407; x=1789980207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8lZ79DvWz2ZoVyX5nf93rjrFskS3i8nj6FxH0msqvVI=;
        b=iikKn2wKr5C8dy9iTyAAQmt3HmMBwmGuXqDHrZ0Zct2xQbOBUZ9bYp0nYlxJGHh8As
         coT9tKDC6x8e35BNT2A5BI53yvvGLBc1xf6XcyWSWAe852qmJ2lRlNUE/wlAtUn4h5Ee
         mAwmW7LN8Zx1GI7Ie3U7rq/4fQ2TU+QoZVBo6TmcTQRf3G36kbpPhcNG8NXF+lBhugbW
         rkVRUknr5vFfyHkw9zzBqGzXQfjM4ci9e0OkjYiizpYb76dqmob11iC9/tpZACCTlOZz
         2zBoXIVVuQA0HEJs46Wfs1DvuSbzqGgOnGEg3PlVQNSEieKOMAIqA9r/JmbcaTIaUpha
         S4UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789375407; x=1789980207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8lZ79DvWz2ZoVyX5nf93rjrFskS3i8nj6FxH0msqvVI=;
        b=XvZvQ23wR5H11Yc0SGL+IGHZ3JDbUZJtaiBZQfOjyr5e3FGVVy4SA0wQkd7JlUpof1
         CqLsG9tIYzzod8pntxHnvQ+pKZtVavRFsMqM3f4BRjJDuYQcs1tQ7r6oS2SDKayebtgV
         kjSz90ASikowTjZGScdI9AJHJF8A9+y/X9EnbbWneFF4oa8dRdttZ8NQGQdjBTaHAokM
         T6xMwOI1nm3w+DnkFDOJk6QNc6+zjj5phPrnwZeV2ZHC5DSs1NymmcFKb3eOhnblSr1J
         YZBw5qLRlOuo9z5OOnq0VTIncg4ozOsZXfzVmg22mzf4eSsXmscRZkfy870nrFYH+e5m
         boyQ==
X-Gm-Message-State: AFuF++l5eheGoxQ/S4MOOdvhILgNAWNITDZr/VEa9T1SmOC5zXvelVbk
	OjVAmOBRKMpfF9ZBGvj+oqV3+rpQ6hzzC8OThd/Fm3LwnAuMoCyP96NL0GHDsTOtQLb+EimE4ra
	zuD7drW5JBg+M76qoTvss8BmjcdK6G9eZ0MPpLNGHhCr7/uOjv/EPZy8pDG/uNUZLRqbx
X-Gm-Gg: AYBFou0I2PsvwZkueboDCO/LfgUFVvc+NyLq6iehfU+WYTOrfhCtwtELjfKejBD6nOF
	yql1PUaM9bQpyeHQgr8tFzR8e7YxM8mqGvaP0Uik/Y1jRJ0RPVJsmbdSPUmNozQQ0EIMxpVn++n
	QZvr/+X2i/C57TlF1AfhWmcFtw0QwnPvmHaVPt2WdCaNFvpheErT1Y8Z7+rPTdCllWnEnTIETym
	/ks6Nm/qJ7lIB4JJefrsPUicBGP6wdZAYFqPSMxkyY5XLa0kHS5uijEUzVd2sMBUNLbcvJu+eH+
	iVCXCdjA6rW5ezBeYF+RPfUMjAbnpigHMEDyPe3K1r54rFOuWYsD2QQEQaIIohTWdfC+VhpdHlA
	5eI9VRLuaHeVfrJaIiKaduzaPbSY=
X-Received: by 2002:a17:90b:2803:b0:39d:ef3e:9035 with SMTP id 98e67ed59e1d1-39def3e96e0mr2780255a91.10.1789375407420;
        Mon, 14 Sep 2026 01:43:27 -0700 (PDT)
X-Received: by 2002:a17:90b:2803:b0:39d:ef3e:9035 with SMTP id 98e67ed59e1d1-39def3e96e0mr2780175a91.10.1789375406899;
        Mon, 14 Sep 2026 01:43:26 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b97994sm44692673c88.12.2026.09.14.01.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 01:43:26 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH v5 1/2] dt-bindings: remoteproc: qcom,sm8550-pas: make qcom,hawi-cdsp-pas standalone
Date: Mon, 14 Sep 2026 14:13:11 +0530
Message-ID: <20260914084312.3812408-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260914084312.3812408-1-mukesh.ojha@oss.qualcomm.com>
References: <20260914084312.3812408-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEyMSBTYWx0ZWRfXyz5j7GE9nacZ
 1bXtRAvCpzubCE++X3Yrh+LJmCgL+8O+F4RTTCcrfGyAHxf0qBzx2FqTl3YBHLNxk/MJ3MIp9pz
 6W6iycvBcfzWngbprOn6SrMSd0YDgymEjyai7CzTiuoFwLKryMbEp+kPC8bYtwOn0QfZ/oBFMj6
 aWfltxiyC8D0/sM48TNb/gJeLMrq8c2+KG6FV8FIFR3nNI2L8iB9Bq73kXXEWBaCb7AgMoQL1Mc
 i9n+MJ6efgVWQ40gdMlSwk9Q3UT1lrwym4VLwX/diWltsAdbOiNFnPafFqvHXvAHlZKTCSCO1e6
 kL0Yc6VeDQ2V0E1K9zZ7pJDw2IhitHxPTj1xPoVX1pHbC/6KcYAPiP0JFsaxXkrMCM5z+pW81aJ
 JSDlcJgoGJfzu8OHObHyLmFlx3t8UBF6UZm4p0an7YglSNlBWeMYxfmpzgrhrTHcF6uj6YFR5gs
 fvuxzzRGHX5MOEeHY9A==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa7b3b0 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=nzVwBEjDhxPf8YtRev8A:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 7u31DhB8MypemEbaN8XvfdJiR4dqScSN
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEyMSBTYWx0ZWRfX8KnVYVnqUngy
 gvayicIPGSMtf1kyEh8mY+9H6zgUFJdR547Mcl0W2ySE1CxvhG2NKXp9sakpwZtawu+g9Ux83H7
 ZL7XepV7bxufZ3mLax9UxljXwUY0Zy0=
X-Proofpoint-ORIG-GUID: 7u31DhB8MypemEbaN8XvfdJiR4dqScSN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140121

qcom,hawi-cdsp-pas was initially grouped as a fallback to
qcom,sm8550-cdsp-pas on the assumption of hardware-level compatibility.
Bringup revealed that the NSP proxy power domain on Hawi requires a
specific RPMH performance level that the sm8550 driver data does not
provide, breaking the compatibility contract the fallback string implies.
Maili CDSP shares the same NSP power domain topology as Hawi and must
fall back to qcom,hawi-cdsp-pas rather than qcom,sm8550-cdsp-pas to
inherit the correct cx/mxc/nsp power-domain constraint.

Remove qcom,hawi-cdsp-pas from the sm8550-cdsp-pas fallback items block,
add it to the standalone compatible enum, and extend the existing
cx/mxc/nsp power-domain constraint to cover it explicitly. Move
qcom,maili-cdsp-pas from the sm8550-cdsp-pas fallback to a new
hawi-cdsp-pas fallback items block; it is covered by the hawi
cx/mxc/nsp constraint implicitly via the contains check.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml   | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index f722c55aadf4..99e9aeeb4f62 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -18,6 +18,7 @@ properties:
     oneOf:
       - enum:
           - qcom,eliza-cdsp-pas
+          - qcom,hawi-cdsp-pas
           - qcom,sm8550-adsp-pas
           - qcom,sm8550-cdsp-pas
           - qcom,sm8550-mpss-pas
@@ -27,6 +28,10 @@ properties:
           - qcom,sm8750-mpss-pas
           - qcom,x1e80100-adsp-pas
           - qcom,x1e80100-cdsp-pas
+      - items:
+          - enum:
+              - qcom,maili-cdsp-pas
+          - const: qcom,hawi-cdsp-pas
       - items:
           - enum:
               - qcom,eliza-adsp-pas
@@ -39,9 +44,7 @@ properties:
       - items:
           - enum:
               - qcom,glymur-cdsp-pas
-              - qcom,hawi-cdsp-pas
               - qcom,kaanapali-cdsp-pas
-              - qcom,maili-cdsp-pas
           - const: qcom,sm8550-cdsp-pas
       - items:
           - const: qcom,sm8750-cdsp-pas
@@ -278,6 +281,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,hawi-cdsp-pas
               - qcom,sm8550-cdsp-pas
               - qcom,sm8650-cdsp-pas
               - qcom,x1e80100-cdsp-pas
-- 
2.55.0

