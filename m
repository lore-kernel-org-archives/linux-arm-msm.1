Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFA5435AAB
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 10:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789381571; cv=none; b=I8uSbJTSvK2Jfp3LFQWHK9m+2bScSQu2kGT2qTAlShI8uzJ5EELRnKpHJbnr8eAUdZBPZwQADW9X2mG+vtCe9I8T+2LDV/tBe8Uw2oBBqrO/HYkyujoasPWo0mmbNnlJpLBZomE2WkN+nzPmrALBT0Vx+iFe8SNJGwP1e1ExQAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789381571; c=relaxed/simple;
	bh=JTnC7evvvSVnCXtJTc4smePwvrp7zkcqWy6xw6xapD4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nxVHzTZ2+NdUzoB/5OLm8CHMZecd/Ci0lZxaO2kVZaKlwrLpVDbDi0ToBS8MmeLHWVe83fVXjueE+ewbJmMzvGUct49kJgNbUttz9RzgUpOb9w8RSYZB6n1vcaCO1ASsw3x+FWy7hy08bh7MIiWa0gqKxjlsSV1yxrTVkhxprVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=nwVcHXtZ; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="nwVcHXtZ"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c294496989aso319843366b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 03:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1789381567; x=1789986367; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m/xjkeNfa3orUpMBTgLWbWZfnOZ+F/SCd2qFtqtxeTs=;
        b=nwVcHXtZxtDXe72sBxVwCcyzRywU2DyQ02ZKTKJBNK8e0Q3gIALRZc+DD+Gi7JhuHE
         U5zX1vTTiTwdEaCUPf0KKf3oiftrr8mqL//DZ0Bzu8E9Us46TcXbkxvWuJgRjxfh7hNL
         dB7H5cvtOPxE6QM4o+KCA+vxw5w/P5todRRLH1b7zQQr9JJSvJ3tI41Q0V8RMpKzG5w6
         5+W8qXcew1XZq+0WhwhfUIwIN/7RHTSGstQTeuWFW/RUr8hMG7v7bApdBfQ3QmKPPLts
         aNG+7BltkEkkN9Pzmg1S/2NnT8IxWp3q03hg88rjcx+lL+2+DjrUoZmBTid54WTFkAA9
         P4zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789381567; x=1789986367;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m/xjkeNfa3orUpMBTgLWbWZfnOZ+F/SCd2qFtqtxeTs=;
        b=Xrm8c+ON5L9yNhl8XEj81NfQqePiEtIqwEcU2UTcJ37mY+DFxrj+SfGKpIz/Xx5uDE
         Y/bJ6oOT9vaRnOtjRx9InU2kAYi4NDKdTi/eLoPYcv7N41692v5droeTCSGZQEHBSmUZ
         +EmqaTatoyzmbvr1AhXQnMXgX1ED/FmSxmOg0A8UmNdsbNBdmFgiJNLAIDWV5adZ22kG
         afXTCAeddk1Mr7alz2bLkfE0qriAydCb78qJwjKSzlW8Zw9bM5ibUEyUDQbicYCGSxH/
         QDuFVH/fEogun1iZTktAl6oQB/9XkmyFBGUDKSkQfLNRky1kGea2N8l6X/v39wDKCpxi
         60bA==
X-Forwarded-Encrypted: i=1; AKwUvBw0EwlGUEKfMUGEj5WfUORXW400zv3/f7XPJnSXjXAtfgDvS2Q9JVSoHcbevysgLrkiP+xYUBU5zSY3DvDd@vger.kernel.org
X-Gm-Message-State: AFuF++ltA9kBnGcXDvzVnU1yzhYYuTbX69dPanKiQfJqlbFeH48pWxbJ
	cN6MoLXMMVtf56uM00v0sXD51n81kHgTzaz/DOyAgikoNSDSQvEcE5oyncd7DBfPkdribMGLdFH
	8GlHmhoY=
X-Gm-Gg: AYBFou0Ym73YcBapqfA8brnp8lgVCJXCn9BjCQvFxOcIQuS/Yf7dz8C4eXo1cx6bn9e
	J3sigJQpPzL2jHQgfffQDF6jfQX5gQNcUhwQJiSojBhPzOC+K0duPp7InbtGKfjcjH2lhwjH0s6
	a5JqYCILLHDhacN5WxpgvN2LwbAClTJ3c2vqjYeCvz7fWNwQzwsSNiRXJhZBE9Fo7dy2Yv/RUIJ
	wtAut5rEoYdTusVdW+uaFSn2dFTC+e8RdzvrP7F0vxYXG52ytinLgm/bAY5U3VTCLt4EjMBLezr
	EMAcvqYoc4hMfrTJUD7MMP4zc01wUwW5lTGtdhr/EtfnlrdOQI1dMoBB/FgSRHqN6fL/Dd3/dpG
	U29mv91JWsv6RXGtWwR1MJGFrFCyPaTlsr/3wc7ntegfjYxmArbILDmqYx/INe7H1Ngysrz9KID
	3Zo2wXqn2dzQEyRQL2fE6+XliXKYpcY/uxzzP+QJW00Slq8vCu1RCNHdIWQwsGUygUV28J+yTnP
	2qdvJmUgPmbDoVG/MjHSn6zR9sFFzD+O5hfYaeRdjwoNkd1OPm0J7pbqyp/vnpEa6H2SA==
X-Received: by 2002:a17:907:9409:b0:c26:1648:a067 with SMTP id a640c23a62f3a-c29b874c69amr127928166b.34.1789381566684;
        Mon, 14 Sep 2026 03:26:06 -0700 (PDT)
Received: from [172.16.220.224] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29660654f2sm399985666b.28.2026.09.14.03.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 03:26:06 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Mon, 14 Sep 2026 12:25:58 +0200
Subject: [PATCH v2 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Fix
 DW9800K support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-dw9800k_cleanup-v2-3-6553273aaa33@fairphone.com>
References: <20260914-b4-dw9800k_cleanup-v2-0-6553273aaa33@fairphone.com>
In-Reply-To: <20260914-b4-dw9800k_cleanup-v2-0-6553273aaa33@fairphone.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789381558; l=1259;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=JTnC7evvvSVnCXtJTc4smePwvrp7zkcqWy6xw6xapD4=;
 b=UixvnkrGXEGNRyEsuLdRQS6wYyb87osS85TdzSWmu33H/b68rRJUlvsvPGSO1HZz69yXJVTS7
 e+qKPeMpv1EAVkjnn2ilPzp7CTjdrwic7uMxC3wLjPSWlV20kFyB3MA
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Update the node for the DW9800K for correctness.

Now we correctly select SAC3 mode and enable timing-control with the newly
updated device tree bindings.

This is a breaking change for a part that was previously functioning,
but only due to manual register writes in the driver. Now that we have
the correct documentation we are able to update everything to ensure
functionality with other devices using this part.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index fa4566df0a711fa0a08cc71fef3b7a4e1a0d2a4b..cc99590afe3a62a2aee3410844ca0815c8f43558 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -744,8 +744,9 @@ camera_imx858_dw9800k: actuator@e {
 		reg = <0x0e>;
 		vdd-supply = <&vreg_afvdd_2p8>;
 
-		dongwoon,sac-mode = <1>;
-		dongwoon,vcm-prescale = <16>;
+		dongwoon,sac-mode = <3>;
+		dongwoon,clock-presc = <0>;
+		dongwoon,timing-control = <16>;
 	};
 
 	camera@29 {

-- 
2.43.0

