Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793656296;
	b=HKXYFyEunaZhyGQwbJ28nSnoK+SCHTi8013ymaR2KAwk2KqJzOQ+2uSl4FZCPVylmJdq
	 NHvkF5XJPDw55512xnUoFMzMan9/O4Eql/v6mvC279FY/l9VZ+l8y8zfMEuccxSqvOOZb
	 DjTnsWH20YG43fRDAJ20Y7OWY795+Cg7C6P3+r6fzRWwvZgyPAxFExGcXychf2210ZuKK
	 SzVX/wpCn7fydQNvNRNPmB2j6t3Vj8IxuXX9cWxUnIeYdBrIDxl6VcxT97JkmpltyJdYy
	 lPAd8GKxsFfqI8CBPWnrai95lsL/As9Zh5NVWqzk5uZHOYqMBMcwmN/gpespK7jICVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793656296;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7jSwJK/207WO58UQjI6Ts9YDU9KElEsJfJqCrITWK3Y=;
	b=lwPsNeMNiuzhS5Y5ZKirltXXTq3mWvYSLIT30uTVFueO1d5OL3oEshzyhBpiFlJQK24o
	 SrriBxd/qIpu83dLdpEWW8e3mAU8MsXmisD14bwvky2W7uX5H6YzI0hY6ukYC3bu9QkzH
	 E+A7uSJepci00+VAGUJ3+e1sS6+B1rrhu14A9eGnTCx3HUX0CM3i67Fkqkn27IDJKsrQZ
	 RrjJIkk0bm5FOyKtze7Ly4W5XbURenkt+pxk9l2oiGbP/aMWJTDLH4qZ0O4Atekrcy/Ve
	 couTKf2VCVpXaJWI5Z7XPQ2G0x6Lju+6h60bqvUScGcakamFNoaItXNqFjPW1mQTTFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dNTSo+Ar;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E5B606D837
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 21:51:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37E5B606D837
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dNTSo+Ar
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36a17a332ecso5462754eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 13:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793656294; x=1794261094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7jSwJK/207WO58UQjI6Ts9YDU9KElEsJfJqCrITWK3Y=;
        b=dNTSo+ArHEY1p8y6b1Gl1CtTGFOW2OPldm8D157toJld7B0aLlPSHWAsnx771XKWWv
         +acgqY+siIoIZGU5HoMCJ+UxlcZ0Y9XJLQh9Ed1A1camRF1+gKook+dsdrXZpjT9BRpM
         v62LnC8uAIBlkJ7zCyQVHZUfsepAmSfeuuhCG/p6sHcJyBDWCNi9biiNteKhCP4UQmj3
         L/96MDWkO8t2uQjrLSjd8EnrCbd7XfVWWqvzVO2vnnE6HwU3mv5kb+Ur8wxDDXbiO5Ja
         6dOp55l8ef5KzbOYHo6IftBbkj6JfE/Yv7LIW2wPg8vxOB9IRaY1mNFy8/wevuonr9kK
         vJgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793656294; x=1794261094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7jSwJK/207WO58UQjI6Ts9YDU9KElEsJfJqCrITWK3Y=;
        b=EGM3FXd3f+rdCi4eQiEOcJ8Sboxu2ApQmEQQIezy53EsYj5yFhMCUJ4OlZYEUWoysr
         HdP25Fd7z04ziOTivhvUnb9z+Shk+8gFnKn1MP8rpvLsFY0G33ObDt83ka7Rs4t08MEe
         aPiS/eH1YBrkvXlt00iGgRDNL9H8jMnKclPpJP+H+0lEEE/vkse8vCQuykCzf3S7wZD0
         8mF/o4ZwPRAnr55Al3WEZakolz6nicicIbNc4J1/313XQnaIPdI/rnwVIn0mVMOGuNUh
         CAzM0BeH+ERLvlSiR7ujVgBppt8zV2cYd5TzMGvLUm3h+Ida6NoRYABb8Rz3Ur/eXwxE
         u0UQ==
X-Forwarded-Encrypted: i=1; AKwUvBxKbsaxMwLxUrnFtixGPEly9HFl5uqokeZm5pdbug0hxd2JxMa6V28HvX6Y937p9f+kVwvkTf6vnuczzE9Y@vger.kernel.org
X-Gm-Message-State: APuU4Z9y6AXe9d5luPWxCYEeeje9q5YsI0rGFOqnmFtnp5A86rXBJIkQ
	GkHu41Tzng7ab22o/YOjNKGaRl7u/E312ezbgHTJo9997gEmCX1CsigS
X-Gm-Gg: AYBFou1ZaN7ifStmsswdQUwLtzuadsfTpFg5MnWsnAIt81ZwRyzcuFNhm3vBwFTM3iV
	EEysm4ISIsfDQcyHZpWgdbL4lzBg+oVQLrfyX+2l00dsYv55I7Tgkluu2hfxJkp9zvkyGRRBZOQ
	QO1SpqR1xwiyjlsweRef+28uiyNrTDk80S7wAbZ/EM3XP+hJBvpKC1q/u4r4yq/7gSfjY8hdWOI
	w/E1eyp8XR65qnP4bbV+iGVYrWRjP3wYk7Az6nJYkECVZkbpsyCfrS6/cQ+AUDDRbUsMYAz5ZTi
	KdBvUK/o1df7c9S/cTRBL9Li693xm0Na3GyM/tDjNUxMxvXApvFHvu7hZJVf0EPPySsKysdn2Mq
	u+UXvqfVHVUASWGvmBu143aKkpx17E6e1rSGA/xZ5w8cJz/YuZUeHt1iUiU3E5sYgBfaxh8+1kJ
	fR68zm0EfAEHb1hsA2BUvNTJrAQiYENdjKcTvEcNK9hv33V2cylW2G2v6rzMiFJxrlm/2Y7sTrG
	b14t3VDyzczPZJSfzMHqQ0FnZIvuOIqKHVPzb6aAi4O1Yid1tgYXoa1ix7joexkp+3AxH3cgsSt
	So3OKS4pOk467ztlTNNmOmNLomb053mDuV+wvp/rfxH7
X-Received: by 2002:a05:693c:88d6:20b0:35f:8c5d:5928 with SMTP id 5a478bee46e88-36a4244db5emr16226283eec.30.1793656294172;
        Mon, 02 Nov 2026 13:51:34 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm54710712eec.16.2026.11.02.13.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 13:51:33 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: gregkh@linuxfoundation.org,
	Thinh.Nguyen@synopsys.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org
Cc: abelvesa@kernel.org,
	wesley.cheng@oss.qualcomm.com,
	krishna.kurapati@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	neil.armstrong@linaro.org,
	val@packett.cool,
	balaji.kalkonda@oss.qualcomm.com,
	tvlad744@gmail.com,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: qcom: kaanapali: Mark the USB controller as a Type-C mode switch
Date: Tue,  3 Nov 2026 06:51:20 +0900
Message-ID: <20261102215121.738-4-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261102215121.738-1-26rote@gmail.com>
References: <20261102215121.738-1-26rote@gmail.com>
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

When the USB3-DP combo PHY is a mode switch, DisplayPort pin
assignments C and E put it in DP-only mode, where it stops the USB3
PIPE clock. Make the USB controller a mode switch as well, so that it
moves to the UTMI clock first and keeps its USB 2.0 port working.

Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index e48a179d0722..a06d5d867488 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -3941,6 +3941,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			tx-fifo-resize;
 			dma-coherent;
 
+			mode-switch;
 			usb-role-switch;
 			wakeup-source;
 
-- 
2.43.0

