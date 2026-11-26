Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795690658;
	b=ISo6iBysUnuXpLHGwDe3DUVna4gSur01EH5lroQ/hu2RxC0CHRONTNxIDP3kgumhMmEY
	 5PthDskpb9IkpwKrCUlP0SyYB2G+EInXjZ5LKzvN/tASQ1bYHdZezyAXAxxlJcuGDs10W
	 XSw83BpGd42IWjqkZWSWWyTnCiqhAFmZEk4B1RD4+dkxcwt0fneac0N0Q1JfOITHIQoRJ
	 THSsOoRX52hhHPbyuESnnZwwxICqKz6gLPChv9gJdCMf9Q/0KE7HAwilZnYOgFnPw6JS8
	 LYxQD3OCVVplkFf/v4ZzcBAp5uZeyWIAOpI2MLSErXp9Z31e3/AsrPnfT2RYryEZB6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795690658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=v9V4lIhr1Yp8113iHXoe8ch5+6plW9DXOYXomuK6kQs=;
	b=eW6mZzOM73a5foiCKXrX/z34aIFSJTbuRjol8/BW9wZGSe4NPLr1oEv+MOl6JW8ZHlOw
	 ay8bV+u0ubT1zxACt0SekQBMUaBXcvSFVTWVBqdAMJY1UqD2VX+4KnP8y/ugXIRz0VAyJ
	 FiJsjG1/TtshR9VwBulsx1Y1r9YJcvjAsGQ3zZLVj7gkuZ4jj34Y20XPogWUHlXgRkof3
	 XaD45X+HNIBb/dK0xWpMJ2pUEWerCW9lSKoIEYBee3ELazimoQnNSDNneViboqJdiK0x0
	 nKSQL4psH4I+gJBemY+OrMlX5au23iOE4MJenwRTfvksNDBU/atHRo8DObCjsfqw1ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tCfZGlcJ;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B90B606A332
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:57:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B90B606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tCfZGlcJ
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4aa5833c263so6594475f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 02:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795690655; x=1796295455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v9V4lIhr1Yp8113iHXoe8ch5+6plW9DXOYXomuK6kQs=;
        b=tCfZGlcJHZ/7qqklBwkZg5bpuriB36lcSzl2nc4fE+GOXVRxjiutOiLH2P2+T/uVLf
         hhNv3eLjOt5JUZzskhAj9vLsQVrMAE2zxKdLTeX4h5pVPe+W/fogIgDTqDRoLZps63/D
         kzdOQ3tqfqfcR2Aq3LqdRuqYDnMnsGAvRODEQ0g77T9whGIuqoOlUZ6h1JDlP5L+W2HZ
         7y8zOg2wNlPUO8RPHlw0tOf5RzJ8PtARDotmjtwMH0egsAE3nURr/G9xY+DOYlaPmsR6
         r86uPNXmEmPHNR0dKL2E421IfeaeFBO2+HRt3TNvYKJixjJXtJGRbY+QTEWcNQo+2cDL
         tx+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795690655; x=1796295455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v9V4lIhr1Yp8113iHXoe8ch5+6plW9DXOYXomuK6kQs=;
        b=2fEP9YN6l94edzUOCC+lm6ZTCIFBYn3gtuQ1sh3piPARAopTcVD06vSUSJHxRUuKmH
         pEyWS+7eZzupVc7bCblsTzGuHmnEOZbAnK25zHYQkKar0S/DdOOwfwCd3tWJCmt1tMeZ
         dXNGFMn3IAPWfrspmuaeDfYPulPf/3g0mnxYQoxiJl+LaK78uHGYmXSricm7XcXT/Utc
         M1ZObMBbbzN63oA1D9klypGpSsCXOOcVXygge9fWqCu2aU67YvN5rSublwBNP0i9Z0Up
         t2DNmo5jwWQtYsKVObPVNzhr56fIrZOpl6YCCKWqLxSsSqmwqb/zeXXedbU6Bh35VQYw
         a8yA==
X-Forwarded-Encrypted: i=1; AL+hErGLnZUBb+4PSs8Kaijd1hzCYVLXx0qHGGM3OKVEd4qBI5pvXOiFrAtV2po2R7VSmq6wBJYIhZgJFDBo72j/@vger.kernel.org
X-Gm-Message-State: APuU4Z9fuGzpRglmE1HwCaT74O3WW4bIaLzmKsDrbisukePo3gN+q8uV
	/EDo8e4l7ibpb3wNSpaIwtOo+S151SkB8XmOxh4nQ65Tcg3HZg4OXNDL
X-Gm-Gg: AZFdTZfSVA++III0t0CbGuUKmXuhmk79+kPgbkefX/NzwmkoQLWUdR8rbbz85730cBX
	DjYBu/IPl5zEAhKf/y0NMVu+f1Ta9nYQyuZVRrJwqpIenu+2uZtNViPEF/gc/Qm2HXc1RTQjWZN
	BZ1V+rXP97SIjVCUcb+icJDhyOVoKbnCwzJ/nAUPZ3QTLwiHmPmQpCz4J+T1YngTMvFH0g+MAjt
	j6pY/ZRXhQwjUUu6VH9YwAhYjBJigLEAp4j+xJ84EqaB4XXscRxiDqpxuIerw3YtWragZuSTVqw
	6Wxxm65xQ9rxKNYQaTCb3Y8xTzfAwBdfgoukCXpscQTjICNkxKKuR+2NrLhD2tzSfPPyk0bF4VZ
	RHvXswe1vhq1Yd+jbw4SH+4P3niBFt3J5J2xBioxIoxQof6o5kFsl37EEz80KYkRyEBT32UO8gE
	LJc01Ye4VZFFGam28D+L3QNry5Vj/eThMScYOAkKqz0H03LI7V0VHU57NWX6HZqY+WzVyPORTFn
	FO3gpVobxGhEJBoyxhNQl3Qrj3DG75UcExibGxtSw1e3Rj6qiFH/dbvTX8HmyLqpBtOApr/yBya
	Gb9+bRxSxKTKQ89TSyezSclyQtlqPk/EjSffoFzCTw4QhjoWdp/JZwEo1HMWbVoLzi2lkVpOTfp
	0L9KTZhMPHq/y34sUL2q4u81eJtAmDy/C/woeXOn2GAtztVFCznh/s0g0jYOrVmWQrNTRiiuaW9
	eufh0V4bpsTX7DkjfXGw==
X-Received: by 2002:a05:6000:29d5:b0:4a9:1649:9eb9 with SMTP id ffacd0b85a97d-4abb2168fcemr28263168f8f.16.1795690655498;
        Thu, 26 Nov 2026 02:57:35 -0800 (PST)
Received: from threadripper-fedora-workstation (d-zg1-148.globalnet.hr. [213.149.36.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm40336850f8f.44.2026.11.26.02.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:57:35 -0800 (PST)
From: Robert Marko <robimarko@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	abelvesa@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	agross@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Robert Marko <robimarko@gmail.com>
Subject: [PATCH 3/3] arm64: dts: qcom: ipq8074: add WCSS SMP2P node
Date: Thu, 26 Nov 2026 11:56:52 +0100
Message-ID: <20261126105722.188103-3-robimarko@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126105722.188103-1-robimarko@gmail.com>
References: <20261126105722.188103-1-robimarko@gmail.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the SMP2P link between the application processor and WCSS.
Provide the inbound interrupt channel and outbound state channel
needed by the secure WCSS remote processor.

WCSS also needs an outbound kick after its inbound entry returns to
zero during a restart. Enable the restart-kick property for this link.

Signed-off-by: Robert Marko <robimarko@gmail.com>
---
 arch/arm64/boot/dts/qcom/ipq8074.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index 1d1c9aab5fdb..7842a2bc4175 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -142,6 +142,27 @@ scm {
 		};
 	};
 
+	shared-memory {
+		compatible = "qcom,smp2p";
+		interrupts = <GIC_SPI 322 IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&apcs_glb 9>;
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+		qcom,smem = <435>, <428>;
+		qcom,wcss-restart-kick;
+
+		wcss_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		wcss_smp2p_in: slave-kernel {
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			qcom,entry-name = "slave-kernel";
+		};
+	};
+
 	soc: soc@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
2.56.1

