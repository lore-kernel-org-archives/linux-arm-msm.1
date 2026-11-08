Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794138476;
	b=AmAQvLRTvQqQaXhldbdIe/NOvivBCii+/nXv4s905+bCSEHijNTEIAF3EK+REoEC1YRV
	 Gfg7LWLhansFgrf8jEJ3BcGSpkjFn4seN8q3XbMhzL6u91mGzSjDr7KnaixCIZvJgOY9K
	 mOFp6cW+hjTA7er51w4aUoIsrefTRd8ZwxJGkkXhNGLasqTCM4kMfl1upBG2MC+uiEHmq
	 zTYV2BeK4AuTXdLZpnaD/UeOWpFCNbyRbAIR6qEIsd0hceg72nwJFpeV+MtlNMqupe+ZY
	 Y/HS2+Kgsz2yCmp9WsHjcsNIhmc7DpEo+F6mkLQui9N/YAKRFT4PfJrHqGFVbKKBArA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794138476;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dH6h1kBUvb/ripshwEjaT3O4DrKwOfPQAnnj8h0Dg4w=;
	b=2TxE3I25WfmEqVy1ruM8HYP3lXD3q0PWef1e+c17aNcxm2dbkhTJurIO5BQ1FliKw5PR
	 5hxstTbD7G1GnikF5ieZA9AUuMNcVrD2rt2Q6vjaMbJ3FF59+sqensEv7BePisn2dVlS2
	 g/9WXiKaFKhfQCZsFK5CzPFj+j4pYGJcIgnqoFuWfVygK1I7nFNgi48fAxRPemubJMuDm
	 +DuBx2dW+AaQQSSIy78kSPsPaKZKID26K6hFabKq72W0/PHLhxWIQOstOFm/RUScQ9I+r
	 J7jwy/V/e5eAiLyZ5F9hwoodRrESEH+VTjuvUHOAlTLgRXmJvyzDO0CudhXg1Tp9FpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=TNZIiP2m;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C147E606D80C
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Nov 2026 11:47:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C147E606D80C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=TNZIiP2m
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4d5b2db4bbso3418666b.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 03:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794138462; x=1794743262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dH6h1kBUvb/ripshwEjaT3O4DrKwOfPQAnnj8h0Dg4w=;
        b=TNZIiP2mx/Dm+kFpt/r1t/gzDe0z+B+AK7jZUUJVHZpQaqckKljPzg+WE/0kBtU+LU
         odAmcgVPrwsYZ1LD074BZUd5uktTD309486lqhSxLZDOwmdkAVejFdzQQvmgxxr8rsIy
         S4zkq41lg4u/Gr9jLBMqaDftfK8631vgHka5rqjiQDQNZjkgJEX748C4OTUa3OkFTMXt
         lF12ALvJkxrWLdyNixF73d8KRL7gYbfOL6cl3/b1b3acDicR5gsAyDE6R1vm/aTx8KVs
         rysc7GMPhbWTd+ihXr7DxMSjDjYPD0U+MwEqdrq1OlvCwWFHqceYaKulD93/xsJNMEOx
         Fs2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794138462; x=1794743262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dH6h1kBUvb/ripshwEjaT3O4DrKwOfPQAnnj8h0Dg4w=;
        b=JaKaWK0vrv2z4SbCTzR2BictLghJatFq5q/vHS1LrZPaAZhtYS8JKZyNZuIbWLua6e
         2GJgtUtQpIyRfdWZbcEerPpj/4cWoJ3FlEvVNrJPeAQf2KEhMuJdTPME9C1vIym1BPZd
         zYhKcvCb59N88j1QXAfwb6fke9JFiaPZlyi0+HLDXmPfO8sMI4cpq5W6UJniuAky6I+w
         RQZSk+IN7sses/ocS2F8Uv8ZJPqPPTWYMNustOz6i6bvp8A9Oh4c74oUW0Y97zwyviF2
         WHB8gjvXnmGhXfkYKcJBAxDRsNBdRKJPfG0aIY/Q7I8qM2Kh5tnsvjZmrV1cwFLE7tv7
         wNlA==
X-Forwarded-Encrypted: i=1; AL+hErHJsLzHXknxbqpSl55hP3biS7pAYt3rk0wvGo6oB2rb4qTZ1r32GPnuaDhsscfyKpb75GutqgLq8mJadY+D@vger.kernel.org
X-Gm-Message-State: APuU4Z+D40tj18V4G9p1PlIAeFJMU1kqdv6xR5fMk5UVAJ4AIJhSMwpK
	vuTzUUIvDJ8NdNInr1Y+hSwg8h+XDMk6iNRLLo3kkOBc3/4nLDRqJZyAWJ1nNHxYDA==
X-Gm-Gg: AYBFou3v9XZU0ek+TyvxqBivSptf47KpOjbwAWyFD07CxXOTIugaxpQZdHb50r3xNVD
	c8XJfHe9PD772y9LXXVcqapr06slagReIhI7M6+AMoq1qRd6EoGkzapwbYx5vVVcoTn/NdfZZOb
	GmZyH47Nwee/PNLyLdZ81fnrxAP+UTg8424vNDjcRAKc7ztCCk8x2Ph6+L+cDurDKll4HkMaToA
	o9bSStLnDSrnGRCUIHQu2mlw8+W6q5ELZaCVkf72pRdwZH0mGVpJ3tnJFq55leiFJt71p4CSp5e
	HS37OlY8AfR1c5sl/A6I9hY8d3XKnN9uFYM0u5bQ0kDAHPCuj0VhEK0Eim/Wo2YGGkaq3EOLBCS
	QS2v8br8pF5qIA+77JKXoU6GqTelNLIHA9yC3T7EG5ejdv9mP+cdaWRNjix0bKNpP/A5H5X01bx
	gOFYhUz5NuL+xUAccHvfTgw2S6SnrLrLAWLQFiwcMPddojJn1lPFp/fhHtjS3VHyry0kDYNEBm9
	6XORD+j/GUkunVfLF56KtJkS+8yj3mv7GnDletxNCtEvhGZ7ItUvYKihwCBeZQXEmb93Bq4IoFc
	Z1R7m7tOUUxXGFXezEKN0qrpIKSQjX7ezCFSLLOK+FVDezTcUqMQxjHIxapOgv/JkATKh1nYEaS
	WtbQUpqw29gd2oIjCXZb7lZ77a2/+cBhKTxRQsMPuASwX3XQKZyQ3Kq5bTUTYtZP/GGMg7xMd3Y
	8IbKckhTVOj9FXQvpCK0L/oYRtUiJfHOKcGSEKi2WkC7BBVCB4ZaFLixSaLJqRegcUIcCVeAsAO
	yXRTKqfGFA6s5XLCQakaDCsHDLBEXo5D4dAg0LlqxL8g6BOyAA9WlHMr2Dm5bZkGXeG9UF0FIJV
	lzaegHiX+N91dhBzIZA=
X-Received: by 2002:a17:907:6ea4:b0:c46:8b87:c212 with SMTP id a640c23a62f3a-c4d6db7c9b2mr101123266b.20.1794138462143;
        Sun, 08 Nov 2026 03:47:42 -0800 (PST)
Received: from Desktop (p54afff19.dip0.t-ipconnect.de. [84.175.255.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a999b01sm56346666b.77.2026.11.08.03.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 03:47:41 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: robimarko@gmail.com
Cc: andersson@kernel.org,
	abelvesa@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	taniya.das@oss.qualcomm.com,
	ansuelsmth@gmail.com,
	john@phrozen.org,
	konrad.dybcio@oss.qualcomm.com,
	abel.vesa@oss.qualcomm.com,
	krzk@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] clk: qcom: gcc-ipq8074: Align CMN PLL inputs with binding
Date: Sun,  8 Nov 2026 12:47:41 +0100
Message-ID: <20261108114741.125238-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026120920.1667982-3-robimarko@gmail.com>
References: <20261026120920.1667982-1-robimarko@gmail.com> <20261026120920.1667982-3-robimarko@gmail.com>
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

(Resent with the lists on Cc; the first copy went to the To:
address only.)

On Mon, Oct 26, 2026 at 13:08:14 +0100, Robert Marko wrote:
> Keep the existing .name values as fallbacks for older device trees
> without these optional inputs.
>
> Signed-off-by: Robert Marko <robimarko@gmail.com>

Tested-by: Julius Bairaktaris <julius@bairaktaris.de> # Xiaomi AX3600 (IPQ8074)

On OpenWrt with Linux 6.18: the NSS NoC clocks run at 461.5 MHz from
bias_pll_nss_noc_clk and the PPE and EDMA clocks at 300 MHz from
bias_pll_cc_clk, with no orphan clocks or probe deferrals, and the
EDMA has been forwarding WAN and LAN traffic for 20 hours.
