Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793086429;
	b=DPYVXOdw4MycrYAHcznmZpeiTDc9khuiYAuyBB5gai0LwXFonXsZzX7deBt4jLpiltOH
	 Q1epsgEBkluvSA+Xdd+BLckZLW+AU/O7JGSPWoXAm9sDiOCh61xIJNlyUID7JGJJNvV1r
	 /3a1zYtGTnSc4l/DBSucWkRzKK0w92MtGQ5Cq7KT7sh3tnr8u5hZfNM9UV3UqEOth+Lp+
	 dSYuVLvECbF9pXW2PphOO35Yki27fds8+j0WfNrwXQ9Wqah73wTlDnsukuSDlBk9/DQy0
	 eNR0WKMhQOWwUALGsZFP6bOElt5f/xZyi7jY3nnEifO4w9KdNuYDghujV7wS5iAOUmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793086429;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wwnouJYD+nzpJg6HWwIkDfVSGS1KUb/CmR0yR3zipz4=;
	b=vEl4iYSr7wn4dQC/fTEeGLvl3NqlY8vDSHwJ1Sx+SO6txUpBl/Bf4Yuqrm5FYlXea2sY
	 JnKvFx+hxN4LIg0U18Qp8TL+Sx1wN9OUdDKuyh32mHY0PBRIWyLmrCCKXTtX4SiOkrLTA
	 hR42Z2dRev7Ylgnq3IGawcD9BI71fxiZqDZGtN9tQ/gHwA6l/uffYQjDh+6dSbGP+DYy4
	 bH+lBjLEDvDQQ96Hk7+TDEAr8oeiNFjUz7MKeDtUZxOWp4McOlXDuDqSmMPacNz8ZyxS/
	 u1vZuUvd/1OWEU7fhtoqzAiip7BiWss2FTISYoQFz/NMqZ6V84i5NMJsD9vYpSLX2nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q7R2roFX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Rz96YG2x;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C672C606A323
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 07:33:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C672C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q7R2roFX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Rz96YG2x
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5ZAu61259166
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 07:33:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wwnouJYD+nzpJg6HWwIkDfVSGS1KUb/CmR0yR3zipz4=; b=Q7R2roFXRZ694ZsA
	oTuUuzcpbi4WErRSIKJ6v1VmZn8p0B1ww46xVLuB8yzMkDtKWr39blyalzr9j+Ja
	t9r5K1f5BEb3dP3j18GTrQLPNYQB4LC3noy33hHtRxfcAlDGQI2KhHEhcYZmzuDl
	QXP0oHh1mEPdrf5WwaDtsL8YShM/QUcwxEh2mXCZ2wJgAD5dBF0AUyH6sHXIhzJ0
	cC1t5XR2Y8yrgRowx6Bp8rpky8nJyGZckfu0GvHLFbwMswBiW9EK2q8MnR7On1OH
	50PUEjIPRoy3sMADroitJ/LTM+jIfy20yOZ2MWIHs313icj1OVY7QMMzND1oIFLC
	X1SFfA==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjfavsnxj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 07:33:47 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-49e5451d6a5so4646063fac.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 00:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793086427; x=1793691227; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wwnouJYD+nzpJg6HWwIkDfVSGS1KUb/CmR0yR3zipz4=;
        b=Rz96YG2xrpFcXPg6hEi6oJFz/6HOoOO9JeKiP1GkOaHLAbxohdJxH1UjegUzmKfMK4
         edmvaVbszLfi56bMQn06RV3aSRtDB1ntrScWebcS9erYjhH48NNt76cCG9ZCI9YtlxQU
         rcj4aq4XGuexEHKCKE6C77EgRQwGMVJUTXWwYsWf5fstC1EJOkm/8d7njx64hzitLBrM
         0hfWdlguRjM4e5zo5cCef3zGbKZ0Ew3+Ujs+umCbzi2IpFhl54Wp4L53VAneQF3GOsDq
         h2hwFufotcm78cRIRJVtijL43z9cRgrzGXAS+4+tb9zmf06w7v5Q+2AnjgBeIKEYfDO/
         NN/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793086427; x=1793691227;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wwnouJYD+nzpJg6HWwIkDfVSGS1KUb/CmR0yR3zipz4=;
        b=jxjPWw3ZaVc0QfFs2TPQ1NGowDCnFdlrdvMdQVL1+37ZUN5NVGtldA+/armtv1XP70
         MXd0ET7GscX2TaCTbA8QpsOvz6xoEYuaGwKqmoSsdHAGyxVaNW8MlkRc4tPh8n/Cnfkm
         mc6pSwbWLJNJMW47boJoHA3xLhULb8yhcKY6WfCpzZxutP4ls5jxsXfCojInJjye1KSk
         daRBYvwIioUmJTnp1gqBuK5dukgnaRvsA6g1Yr994Jj0io7wyI/jCigTqId5HRV4fE4a
         7gwUd4d4flmtUED1h98U7WrTo0IBLJKcd0w6rb4aA5eaT77p2x2OjrLR/iWhX32g8+82
         BNwQ==
X-Forwarded-Encrypted: i=1; AKwUvBx4ZA8GyXGci9TuzIyHspmdnuw0labWnCVPKfW/gVS7JdU4t7E/+J5F4Ct6sop9BPqzkS6pLmYS26q+1LZx@vger.kernel.org
X-Gm-Message-State: AFq9FYJDFM9HsTPxcs0lXhG9+CL2CNRDAYiQQ0OJeumaNL8fgcVf7euT
	vAp4YjCDKNUdAKgqczG0mcjUm5lyhqHowb33oQmnJYkPV0+DkT4Du188ym5CyrSsTYcMDfuHpLO
	OKXCX9mhrerbKKBTi8tR9/oFaRwN05tfTSrP2MCq4+CJmuINaCh6aJdqL1tu9F3Hk/peN
X-Gm-Gg: AYBFou3BOpev0eJnzXOORx55YswAS7bAXJdclp8mnrt6JmeK3lPEDZuQ5M4yWcm5x99
	H86ybvATNQdEARmZE2O/X/ZULzA3+5Q+3Vxofd1X55qjMLKW7JGI4HBPjPoL7yrU2IIuyDo4NM7
	s/d1f8DRWN4ZGvgja7ls2F6d5CM98UkAbkiUhcJfKBBsOprcdYhartpXCvHjUVYGQ5Zhi8dOiOv
	E9QCVdXYbP1wM8T7washqk7A6fmeSoYfK2+k04PmVp2wcNv3WjB+P1XZbPPe3P8R57/sHV1wy0s
	ff4f2emtQN1mVDDOLnyvPl75LsVYqDyp5UNzEuL91gMyudSNIS3bFHAfHnmzNbzYJopwqLjXmtK
	WeOJq7BzEr6jZRT+Hzr0FEql9BzRi7E+Zca+E47RzAmewpW9dyQXY71BZZ4+bVJxR3TEu0hlCmS
	juOukeeeA7TnpGjyUHRD6l2mm04FEnqeK7/TcQbA==
X-Received: by 2002:a05:6871:5298:b0:493:8967:86c2 with SMTP id 586e51a60fabf-4a83f4eb4c0mr5116187fac.16.1793086427079;
        Tue, 27 Oct 2026 00:33:47 -0700 (PDT)
X-Received: by 2002:a05:6871:5298:b0:493:8967:86c2 with SMTP id 586e51a60fabf-4a83f4eb4c0mr5116170fac.16.1793086426651;
        Tue, 27 Oct 2026 00:33:46 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a843225d69sm6181923fac.15.2026.10.27.00.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:33:46 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 00:33:33 -0700
Subject: [PATCH v2 1/3] dt-bindings: arm: qcom: Document Microsoft Surface
 Laptop 8th Edition
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
Message-Id: <20261027-mahua-surface-laptop-v2-1-7dd903a12d22@oss.qualcomm.com>
References: <20261027-mahua-surface-laptop-v2-0-7dd903a12d22@oss.qualcomm.com>
In-Reply-To: <20261027-mahua-surface-laptop-v2-0-7dd903a12d22@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793086424; l=712;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=I5VGgvURKCSh7RVlYn3xw6pmM2/y68t8tHmKUFQr6Nc=;
 b=k0RlEAFG+6mYw2LZ2mOH7ywRiIRgsH7NO3QjxcnAGxl8AE89aMSwrSxYS/2AHMfMSjGuEkv6z
 XREfC8bq6aaD0ehDBkKI+mDKwIf/KeWydhGGVgs9CQnsD4tA9Rm3BNk
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-GUID: KhtEz1o-V7U1DCngpVwL58is4i3Rsa3Q
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAyOSBTYWx0ZWRfX66qSCa4KIfpr
 D8gDPxaOozrr65kRMKipdg7NDGpQFCE3/NkCi9BUYaRSytsaxLK7yRQO4WZMSSyrgBpUA4IsMzf
 93N1TSWAAINioSXrPdTdrjkICi7SK3Q=
X-Authority-Analysis: v=2.4 cv=EIeTQFZC c=1 sm=1 tr=0 ts=6ae053db cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=KuocmVZnZXzmgL9DMHkA:9 a=QEXdDO2ut3YA:10
 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-ORIG-GUID: KhtEz1o-V7U1DCngpVwL58is4i3Rsa3Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAyOSBTYWx0ZWRfXyzy8SzJt1iI2
 D49nu8JRCrd+E3o2MmBUCknwzfKdEI48pnPG4QJIxjOpVO3LhuqzgXXHfF/KpuEjRRUrumqC+yt
 AIap4+TKdCBZnX3gLutGkudGkVDof6xRbcI/BaqYU3zZx6bbUOgG70i6LQkXCFXHWehCOZFlXuU
 /WSSt/U1GXmfL+Id3BRm/Qy5RjeelTb8uuwHMgAVdkW7k9MK+Z2TbR0NbiqeuCYjiq8nfxqlMbC
 Ywsk2GAovBZZf4ZpMIokC5tDp6wPc1Q5KD8AHpuuJYkuGBUY6vwvINy61h3qH7+6vfDNYWUL803
 qvU88xJs2ozGgy6mVKHcCSFa5CAjBO9NEC3pklsnxXcw+Yo9vkOggYAuJhE5elvZyIL/hkt/IUM
 dJXZzLPEl0PaooEQLc+bsy+9TUGN58HstU19mEMxWVfmh7ePVKya8zOQG8lEZyHMyRQrdDMLhVL
 uMmbotTWjLuxpkEnZCg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270029

Document the Mahua-based Microsoft Surface Laptop 13.8" 8th Edition.

Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..14941a0b0854 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -191,6 +191,7 @@ properties:
 
       - items:
           - enum:
+              - microsoft,surface-laptop-8-13p8
               - qcom,mahua-crd
           - const: qcom,mahua
 

-- 
2.34.1

