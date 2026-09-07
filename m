Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E4551D50D
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 18:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788804637; cv=none; b=u+wpWGYT7Aw596+ft4YQa6Y7xUNmIkVqdm4r0QfTZInLDce1/4dsCjsQMbmc4OLr7u46sBM5yjRBCoO+Vdh66hoWANzTdx4gNiAc3d7o40qZ+0714RYq0J3dkeHEdViImk19mEX4wdAx3DrkDCNBvHdNbhFGo8rIM4qxC9653S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788804637; c=relaxed/simple;
	bh=dS0jDXHlVW4llf9vuhR2+deqH3p/w1Xv3ipBNHhZA78=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SvSUzaqlR6wLfRDX5PM/7kykcqdF0bKTCg08BciNxzWVqFqN3FJIM7WsuooSB7vyplkidTOeyH3lEz+6nBSBnJIfnC0x1nPfAFmYillPA3abbQt/QLoBvw7OwSu9roCsVylcZJgqExW/u66sQLymqpF8KGrTMP/p/onvQjH3qIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L47wz2Zy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GQrtRaTM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L47wz2Zy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GQrtRaTM"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687H87bm4183550
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 18:10:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VO0PQiHDx30LGg+w33cmq8DXc7nasM3WGJcKJJwoAGA=; b=L47wz2ZyTd6YmryH
	TG1s5xAgB4Fb1dilaDQqIsFq4S5A0Q8FgXU/fSXRu2pv9oknmW3Nocxxj8FudemY
	o6VvbLm4jThfJjCLhB80en7CQYNqRDtVMAHiF0LcuASBwEgnmo8wO1A/IrfHtb6i
	kLVsexJdkEHhTDEOrJrG68gnBSbnuyaRf/kOmlTgFYeDVVHY14rFCfjwL8RKwXfB
	57X5b8GVhHur7PoJKufX3qAe5ownkGmweTDILfCPqVCA8MtUUVanvxj4z/WE7QqS
	Eod9S9EeY5krKlCmnd9Yo/jdFXjKAm45S4ssLyTVIx42KrVXsC/3qxFWnbdLJbAv
	NthG6g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtfx1xju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 18:10:35 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3968bb86fb7so4520788a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 11:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788804635; x=1789409435; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VO0PQiHDx30LGg+w33cmq8DXc7nasM3WGJcKJJwoAGA=;
        b=GQrtRaTM8WOIVOSacgS593Iv5cRMiD+7tGl6DnpTsx/9QKXPI0gI1IpVnQPKubbSWt
         KRPL1dBWiFGca+byMPhqAw0BmNBhuOX9INLPz090U3zrjbLs6/4iPayrGgUkk/BYTWur
         74WZXkz//7/HavfO9ncVVMkrdg9z9QoDxnVlXIxEl6UFRatYvppmnJPlXz8h8434W2/v
         FvJyQSxEdso/RgfVDeVTywo23By2Ld4JL26lJVaehjOtPimH+h04BS1bLJtun3z7CKzP
         oao88rFzycxM1lzko2dS/8rOGuPZE2Ow/uZviUyo248taVF8B/JUJ7FgHA0wUjjNrzR+
         6C8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788804635; x=1789409435;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VO0PQiHDx30LGg+w33cmq8DXc7nasM3WGJcKJJwoAGA=;
        b=UNjIUHAyGwPoDaSXzEF2MX0N3mHEznC7CgXKwmLjDlLS6z9tQiHwiwWQcY1PrzbaSg
         NblNBHBaukY6AHYwSavVals7JxdKxw3oRn0x1BsWWnE1+yNETNJYvXbfqeshzrjAOe1e
         DVmHy21piISRR7Aeml2oj4mj6wW9nEu5wx4Q3CnZBikgIJjL2DJIyrI5bSp9U/jMDQbg
         XGmbs9SofHtozIdEwlh7MFHZnQPTBDSBMONJ3YV9nbTDAfjY8X73kpFQm8IUIRbr89mW
         CgEyvIZUexj16+dd/bKM1PtPtmdq95FCvF/Lfk6AKTGjozqtPO48WKzsLKqeUlWI84Y5
         qZ/A==
X-Forwarded-Encrypted: i=1; AKwUvBzKn1fJe+ZoptWXc6KFtkvQz1wsLJf+rUcYLdSyslFxXl76be8xgmg1s0OH97G5F0oE0MyTy8o0FJCrHS5s@vger.kernel.org
X-Gm-Message-State: AFuF++mTAyQ/SsnopEULPqHDDCW2/2cuOqFarpPbVfaUPyElZ4sJAnfe
	B/xmzPcBVoBDRFiqVblUmatkbGXmFLQ3+EeMmkAXgCJUhY9MNokY/Z2zn9X/NMY+RRH3t2zwQCq
	zGvNFNsmEnpx+AdIiaIFu+hHANIoZiaqwR7mzYY1RXwbSAzzfTOcOCjdwb5CL+SkBj9ok
X-Gm-Gg: AYBFou28HI27qmkd97Sw0PIOUcdhxsHjksAge7ItBY8QtzDNTHi/V1diECbnqBSQIRy
	x5i1HRYhofOvIM7PMR3DJ77cy4k/KOSTEUojNONfH4cX+pA5jhqla7TbfOR1gKVe5rSF49N3li2
	nsCyufw989xHwFDgTDFevXfHn1oW4Yx/9p0zpVcLZFGHmu+R6bv24L5B3ZMLwt3VNcmTeDxXs5o
	3dXcN0CNWXkrMgueLrQZXia40r9HQBbdrHN1U/In64VtU/Sxw6HZPmbqS8mLCya5uV62qQX+UgX
	6ICi7STX5zwjnvecxmQua167lnYrxlZV3njZ2SucY3LggjWed2FCgko9gowOm130SD3Utck5GwE
	y5xPtVRGdlRKaoRXjxDtmf2+P56gzAr2ihmHJ
X-Received: by 2002:a17:90b:3852:b0:38e:9ef9:eb97 with SMTP id 98e67ed59e1d1-39b26272d69mr36796092a91.16.1788804634650;
        Mon, 07 Sep 2026 11:10:34 -0700 (PDT)
X-Received: by 2002:a17:90b:3852:b0:38e:9ef9:eb97 with SMTP id 98e67ed59e1d1-39b26272d69mr36796023a91.16.1788804634200;
        Mon, 07 Sep 2026 11:10:34 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b608409sm33961954eec.21.2026.09.07.11.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 11:10:33 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 23:39:45 +0530
Subject: [PATCH v1 4/5] ASoC: dt-bindings: qcom,sm8250: Add Nord Ride sound
 card
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-nord-asoc-driver-support-v1-4-997d3b20cf43@oss.qualcomm.com>
References: <20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com>
In-Reply-To: <20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788804602; l=989;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=dS0jDXHlVW4llf9vuhR2+deqH3p/w1Xv3ipBNHhZA78=;
 b=7UuavNITpn+sMxMYWQTId+dxqjXUOxi8+6Uzm0d7zkuTzy0sD2r8oO2IfkhwJ6XTESYDZYfUU
 j4hMMr31DgtBlUEqgLlBoiBTJfxyiginDjfjO2vsqd5quWUIz9XVNQZ
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Authority-Analysis: v=2.4 cv=Weg8rUhX c=1 sm=1 tr=0 ts=6a9efe1b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=7YRCYCP2VF9Zukq8dE4A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: PW_B8iiFpQ3RxOelboMIuhKlUsRBwmnc
X-Proofpoint-ORIG-GUID: PW_B8iiFpQ3RxOelboMIuhKlUsRBwmnc
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDIwMSBTYWx0ZWRfX/K/zVeWCaO2h
 9TUSvw3wN2VnsYZ+PVtOt4ZV9RVp7HniPZZtsShdQX+8DK+165Fjixp0/gMiAXyFdj+B8QUvDIq
 VCvSW2IOfrttqQkFI9Ov+bIWx+Vb9yU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDIwMSBTYWx0ZWRfXwURvkGbVi1cz
 2vDRm2CEigimnVWKHElIxos0rUI09ToHZ6XqVQgN+igMUohEg/gVQZV00PBKC4lYrquYeeUFwa3
 z+JogD2NU930vyWryv19qrqEm/b+TBmDmi3BStYdOfSCTr41Bmykr7xMh+5ZjcVReVIHQ8YbJcw
 zHRYdu92nY/wa+QUpEDA/RPYlJLp6uRev+0m4Lgvfcr6BYqP5vc5ebtp8VhA4J9nQVTxZx+h8jF
 ix3Jlisr0SyphnZ+krxYXUMM8N9X9AslkPQrPTQphOpzFnF9/D4Szmm80L7fkoqI8tQKoKshlfp
 eN54P/4aWsIlHbj0sFVhCRbKS02gypmpAUS7xrBhDLfHumhlKhS4NzvfhBqYbQAPdAp7lBZ+PwR
 bxHMbyubmWVlmo7e2WW3kfvQhDrtyG3IkTZrLakXsTUGdOEx5MIAua+EoyNYWXXiWR0O7CNXO5k
 wz/FPM9JWTVcB7I9COA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_05,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070201

Document the bindings for the Qualcomm Nord Ride board
specific sound card.

The bindings are the same as for other newer Qualcomm ADSP
sound cards, thus keep them in existing qcom,sm8250.yaml file.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 1536fcd96d68..bdbaa8c822fc 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -38,6 +38,7 @@ properties:
           - fairphone,fp5-sndcard
           - qcom,apq8096-sndcard
           - qcom,glymur-sndcard
+          - qcom,nord-ride-sndcard
           - qcom,qcm6490-idp-sndcard
           - qcom,qcs615-sndcard
           - qcom,qcs6490-rb3gen2-sndcard

-- 
2.34.1

