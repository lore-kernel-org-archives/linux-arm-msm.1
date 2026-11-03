Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793713874;
	b=16h18NyUD1bBndedzO3hXTG6u1IQdsV1hwGlCNex7ipaS5TcmO84wOiywVb4NfuR2xNF
	 NS1XJOvR/5ewYv6NDIuA/dInpYoKLRHNz4vN9QLy6Krb6Xpzp6x7x0e39RTNHieznlUBi
	 T14+nz8Jc5Qo5cGHH5WXamaDXmYmaiLcdN9Q3gmvPkmmrkkFvUMlbqJeTLIZEU33klTa+
	 cCOqkkTE0zs3yUWeXr1ZCSEENVRH8E6dxFBGyPQI92Fjjyn1luhXm+OHFmNVtxqRPCtcN
	 O/xnJT9vi/1Vgzb7otlB5f2Nt0IyKM7tMiv3H8mPTew9hIGJ5UQ7HOOvKSDmY72L+bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793713874;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=khEl6AiVmGdFxootcAKTxbxTqRouR+Ypn7yM7tzmVes=;
	b=V/b5aQp/U0K9KVWlTeVIMxXSdsG3UVoSSWtilrbVpSSOW1YgyVWLOuq3QseMIxoXFVqj
	 PEUkUhlouTWA422ThXPCIpayzcvQbXq03Y2PYsrmFdIqt6in4R4c894C6ri/ATIf7Qzc0
	 +t5Jn0yuwtDp7IxyDtvsbYtpy1g9b6JhKdgoWATXGPNZUEUmogUtrIkm5oXSV2qJebARP
	 YCK8zXMLypCvNyLhjxZbV2Vrm0dM/LxDzF5aBNNa5BvKSGNriB58vryBt4XaJG9IY7KDr
	 V56asYiMvEVVrOpptM4fS6oIlm9c80ww0tADOwYm/YYTQgfcb4rTGtU0XKiuUwX67Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ublNyEuV;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD3A6083628
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 13:51:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AD3A6083628
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ublNyEuV
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1ae58d17cd9so1110491c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 05:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793713873; x=1794318673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=khEl6AiVmGdFxootcAKTxbxTqRouR+Ypn7yM7tzmVes=;
        b=ublNyEuVZhEs1i6z93JX/R8YewpZyMQAk3YlLFwfuXYBFSs4sfkWLWIfpH7P/AJNuS
         5qixV2Ch2exi433cUqhwtamsH5RTjKKU5h+UnV5JwGoMz+/z5255XiDa4N8V1E1e5/5m
         xIef+CIO+jQgdVmK4fVDAbtkxiq0uhCruvAI43NOs9cjwT12hiRlo91JCbLIKW80eVtA
         AT2480xZi4B6M19h6dw5RIaZjKogbNOIf3kkerNxRy0JgoNulp0m+f42w0sQV9RigTM6
         LTzwtARR6jVp6JcgqjxdNtoiPMyOT/xT5JoPXvxsPpU9wQ//lqBy9S1SjrH+olHgj9zq
         xKXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793713873; x=1794318673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=khEl6AiVmGdFxootcAKTxbxTqRouR+Ypn7yM7tzmVes=;
        b=kZ+bugvTJ46Vi634mI4YsE9t/WI7MFgtDxwasxbiYFNgaq1IqViiDQBUB6arZkeSIZ
         cekpDbu2jcd6SliBuYFUs9LeqSh42d4SWEc4HcdknwKpk1ZQn+zh8wtMRwaxlGkO5nuW
         9Xr2QreA4aE5w83uckGpDXsUeY1Qn57yoUuREbP/eomztH+IVQCUFf/9P4nPYNhSXpG2
         2Ha5QqZ9io4Mi9YeM3RzVChdlWYh0bfpsozvMkv2iJHSv1pFwA6eTUiSRV7z3y+f+sfK
         beh7cX/hgFcXa7NnQX2BCnUTYjzi91nlIFLU/VH+Pun8jxlvGo0OtgzN3YMvCkMYMvDV
         uQ8g==
X-Forwarded-Encrypted: i=1; AKwUvBwtRXQfk2ILIFk8x9fqzqPppwl2yTpp4hSEw/cCXPoyoQxxp1GLwSsVXE/rBkHKVHwtfUd1GpnrtMnifiTL@vger.kernel.org
X-Gm-Message-State: APuU4Z8WQRXNVrkBgFejgj+0jpfkw34WLyK1Dksw2bCc3crLDL2axFOM
	VBAwFRGkKSRzNC7yGpKCIuy+LhtPUdc8vq+Sp5XOgQW/WhCmlyI8ZVfE
X-Gm-Gg: AYBFou2C0RGWuGh3ugDWYIYu05HKlqYF0PL0DdrxlRLjbgXi154H8IvVcTjv/4RXjcl
	PkKAPrgaF535BrBEmT6uB4/mXF8nUeNgaK5YbFjFDqEu/E7+lObQsCVGrb9V+Q1YWFR/wuZPy09
	37i6mqJpyNiQ+MCde420gWTQe+zGyMpAFf9ZkP4FVaSFRoYiNf+7zgOdcY1gyckC0qQniZuhfn9
	WmJ/tqcL7WoyLOVbLSyMCp//8PAGbK2hJAs+zovFDwN8VCWqqUpGbLX5fVo5AiELaeOPg24K+aH
	7b7nm2wfL/DgS5C6NUeNNOkTXLfE0DZvZ1rCkwnMB1L72K544I3oUCDbtiZhpu7Ub+WsOzZV1ft
	vWnf8tj0GtS42yY55cQPXIF0EYzLAbKS/dcgtgEH6DNNmTgw9Nl+fcNzQZkzbrqkdfLhtZZuy0Z
	1hJ9nNttz3+i03vY2zcYeo0Lbt5mNIo6velszj2kfQiwUsydTEdeuMU39pvt2ZqXZn/XW/EGAdH
	+LGcA9rfqMY0QyV5zwm3W8jKu6m/7ynBcs0vkbVQlnb2SWYhpWVPloSo8B6ZzVQvcP1KJErIq5m
	yHmj4M+VWFaDqipC5v1V0cg1gOIpbnGn+FYExDOgvwnq
X-Received: by 2002:a05:7022:4b:b0:1a3:dbb2:478a with SMTP id a92af1059eb24-1ac5c92de5dmr24655310c88.27.1793713872384;
        Tue, 03 Nov 2026 05:51:12 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1845817csm42837321c88.5.2026.11.03.05.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:51:11 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: gregkh@linuxfoundation.org,
	Thinh.Nguyen@synopsys.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org
Cc: abel.vesa@oss.qualcomm.com,
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
Subject: [PATCH v2 3/3] arm64: dts: qcom: kaanapali: Mark the USB controller as a Type-C mode switch
Date: Tue,  3 Nov 2026 22:50:57 +0900
Message-ID: <20261103135057.1682-4-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261103135057.1682-1-26rote@gmail.com>
References: <20261103135057.1682-1-26rote@gmail.com>
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

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
The "mode-switch" property of usb_dp_qmpphy comes with patch 3 of
Balaji Kalkonda's Kaanapali DisplayPort series:
https://lore.kernel.org/all/20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com/

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

