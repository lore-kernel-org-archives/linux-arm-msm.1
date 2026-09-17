Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4CF4DE712
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 11:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646145; cv=none; b=ckAeyh6Pl3mc+SrUzOu+i+raJM3QK73eHlfr8YajCQjo5rFg+RpCs9xWvF2d6UofLRnwoRGUbJXlKLrrQBFZYuCb9iy89MpIzKUJQP5UOm5kVWGHAmVDlvJ92GquxzwvN6/VGVIyySnhAFdGcjeul6hR7MIOvPNtnzNzA658ZPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646145; c=relaxed/simple;
	bh=3UO+7i3bVMM+F/tEv/xBz6Ef+c3e3C4o9iDognI3z/I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AVmljHeIykIXpF/ZcYQNPBWBjhK+BO2zLBpQmp31CBeFHE9C4qf6WctUalnT38BiF8N7I3/gCH0LIMa/4D6CnjCQuumWhAHZ9zQEfpExt5uZKkgOfaZc0N6DcgU7+epjugNj9oLaeu5r6BfWuHebc6VFz6Ci2Lv5+3ew332Qj8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aj5iYwrb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F6X19oeN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aj5iYwrb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F6X19oeN"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZhOu1257991
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 11:55:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LkzXtqKbuyBYJrFeljSDmLrx0TUg3gMqk1oP45bnArE=; b=aj5iYwrbJT5InyMb
	S4FStayXNOWDoZnW8TWKshf6F2YJOi6CmORaZrMaMiHWkFfO6jWL03EsA2NGElFX
	f7TY8IxaSsdfUVM7Hl87IJCzAZ7ZfzODSfG6rUp18qD40cFpbvIYwEF0sIUCUX+V
	vFIgL5CdOYFMC0KfYb9qhlvgihfVlcXK8Lj/UBrX4xq/8d83YxrMv2eWCN7frEgN
	r/o7ofg4lTOHlmz/XaFuwT3wRTaFdIh8cVhXpThVZzB+/Ssoy2WOOVfifmug8MMh
	3d+GWvL2JeKTMqYn8ToWavwSIVLndy3V2HTY4xzbaJsnHH//r53bnRUdlgY0VGuw
	nzhE4Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grdftgkq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 11:55:25 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39d8646b10eso884612a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 04:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789646124; x=1790250924; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LkzXtqKbuyBYJrFeljSDmLrx0TUg3gMqk1oP45bnArE=;
        b=F6X19oeNug5fpPXQgNlfYz6CPmZbLoLZRQyZiNVIMcgiPY8USnnNRjvtx4Qq6+3Qv6
         mJ0uH4w5uQ2DVZC/dfZXLH28ebxis9D9Fp20ydnng/7c8yHSAsoBUeoSKF5u6h8nxZkt
         zDJmncjUNnnG4gEUvLdAkJmIJ29kJ2ACfnoPC227aW/1HeE8Zj9hafDFr5vM19e/y7yJ
         IwM+SjQqNzWBc/bPUsylrXK5Asq0zcu2GlcHC2dQ6WOORrGa69OhKLCViCwyoWWLYV9h
         ERsNnldg50e/a5S31DL9KF3UfxB9cEfO8BP40iB7iPOsMu+aDFGSULS1ULXV2S29E9tv
         3efQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789646124; x=1790250924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LkzXtqKbuyBYJrFeljSDmLrx0TUg3gMqk1oP45bnArE=;
        b=k0ex5A+XpuSXS61WNP+y/QuTLoqrYHfjg1/UtMvgMqQ8aNran6ErU15zaBw0DY8qYO
         b3IBXT+NpsmAyA5pmpdKFzhTgFbWmTvqwoT4V3rhggWphvE6gxf+lpMq3bcnjuM2KYJJ
         g/tuzn2eHblI7Vq5yRYjQ3vwqP5otQi0dAoh6EfuMSn6+QxiDrTWUVfrUngyu7rexLpo
         B2qIClYBx0FL+R/9kHrCSQcdqpcy6ZTSLweZz+jTW/muHVr8CVUMuXN/D3aojHEOj+s4
         ndGvnHQsVoW4/0Qr5Xeo4SCaVsANa99XHuAEOVaVk0ivAZNvK2Ycwltz6YToouhoS4dn
         ifIQ==
X-Forwarded-Encrypted: i=1; AKwUvBw5mpf2L0Eh428iF7dmK6UtqHzMQEVnIs16ja4XTjLWdWiSd1zADg9PPBojwU0WX4h6r6D9EjoHiN0Nvkum@vger.kernel.org
X-Gm-Message-State: AFuF++kBwAp6iJuABTjjCUR+ydITSxIBhzEl4riMfA1Oa00QCVnBS4+c
	CtAzunpKyrqgThKAtB3b3vKfbNrs4qaHU6swIIWrzy9LFvWLADuK5M6fi4kP+JmXHQe9crctU9z
	cLQatI3cPDyPPgeL06bd11kFKuUeU42djDtC+eh9XSYCDNasIoXxDnvjXQF3N7loszTan
X-Gm-Gg: AYBFou2f19noOCr2eAIGHiX0+R4PSdTUswemiFQCrpEoMLZjSCJ0Q2ThYfuBD8TGxgz
	+XACjjGJUOwl4s8yi1BHaiW8lmCz4o94P6EJnb5kGiqNsD+8bSeFJ12QrJpYw+lzG0JMKNc3FMZ
	JtERopyJyucBFeLeFbvEaTPnXuQ/o3aO9IY6oAme5ufERqUxm+u4BWZN3JxI8OJaQZSOvLgNval
	v/Z+tlg+JGQj2/wH3ZF3DFf8558E45fqRhiu0xg599fFzI02lbQKG833Uvx5Hbm09VQh0QKL0hW
	JD6kraUd2KDK/LsYLBkQ8aDayN75Lr2c9+x5lrzoY1M2fHjk5Srvil6TT39bavvVsxn7jNZ33Dz
	fD8C8vELE5ClboXjjhj1Yc9bBW4dLGzdP6g==
X-Received: by 2002:a17:90b:2803:b0:39d:ef3e:9035 with SMTP id 98e67ed59e1d1-39e1e324463mr21988769a91.10.1789646124338;
        Thu, 17 Sep 2026 04:55:24 -0700 (PDT)
X-Received: by 2002:a17:90b:2803:b0:39d:ef3e:9035 with SMTP id 98e67ed59e1d1-39e1e324463mr21988636a91.10.1789646123700;
        Thu, 17 Sep 2026 04:55:23 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf596e1f6sm18249500eec.1.2026.09.17.04.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:55:23 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:24:20 +0530
Subject: [PATCH v2 12/18] arm64: dts: qcom: kaanapali: Fix PCIe WAKE# GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port-v2-12-0d627d0856d5@oss.qualcomm.com>
References: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
In-Reply-To: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789646072; l=933;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=3UO+7i3bVMM+F/tEv/xBz6Ef+c3e3C4o9iDognI3z/I=;
 b=u+BLxxMOlJ7ECpdh06aQcLMRLS+92yOFFdrZAV3wlY1eCZwlJYhFKOu4PN3tg2k/saHs0ZRno
 Z92NVXuWgcpD3jF0KWF2OOdrv9hwVzwcsaTv8H3heV8g/Y3fVk0Kn6p
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfXwxAXAkyc8T6P
 x1kIhPWd42J57nLXdI46mWBJoq9PiiFMmymlL/tRurTQbIH+ooFwQZI3qrOVbyjNgeY6r9omsPT
 MyuYNY69M7yFviwPyK8XcTfFaYH7mNtmRq8EiTlXw74C+hY2gQa2FAo4O42taj4Egy2cNA5wLQ6
 6zK/1ROP35KDAbayabrCc3Gz1Lta5595rGSVLiSqhEvYCChqrisGPJoNJ+iDDha+vrTgaikJLJ1
 J53VF80svnHTMx+eoDanczk+sGmVMVrVlKzSIAP72+AH2qQSjGl+TXyb3+mLbyFAT5t9yvs+UH2
 t5HnOuzQo6gL80F4QjZmM3lJc3+1YhXOHzo/BL1L2zFOhxbAcem/plguri/wHghS/16/8Cao4vU
 rIN/PBRfYQJQ4e9UGsSHkvUQyCQw2SEK6qpLPbt9eka3cfd1/VJNsgHrvynN6977lNcAG1WyYK5
 b1xjSfVn2vMYoL2POPw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfX1fT2XxshCeUm
 JxHLQoj8JbS+YG6Wmpn4+Cl4kaReSeKlts+ViwQkd+/URESKq16lI0q0Lzt4uYYMtwkQI4ueX5o
 1l+F/15sh5tGGqo0h+3UFOQAOsMD/Fg=
X-Proofpoint-GUID: FgOnfaMqbTt-AUMvj3wFuJZWyONVFNhQ
X-Proofpoint-ORIG-GUID: FgOnfaMqbTt-AUMvj3wFuJZWyONVFNhQ
X-Authority-Analysis: v=2.4 cv=K+W3jCWI c=1 sm=1 tr=0 ts=6aabd52d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=bu6UjZ7a5GH_BZZocUYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170166

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index 6d817381bb37..83c4f93a654a 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -976,7 +976,7 @@ &pcie0_phy {
 };
 
 &pcie_port0 {
-	wake-gpios = <&tlmm 104 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 104 GPIO_ACTIVE_LOW>;
 	reset-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
 
 	wifi@0 {

-- 
2.34.1

