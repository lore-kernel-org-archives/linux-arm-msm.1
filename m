Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795874047;
	b=tYymPX0tv4t9MIXIYh56MnbPJqaaGwKNoVXQrFLbKyq+UeAkabsorqZ31ewDaBGI4SsV
	 OBxNT4TuposZFnITWeSHwTGZuZMAEcoG4Z4hyGdM7tOLNrrtiQML4cjMzw/75zpDd9ROz
	 xdtSc71U2rvloUaVavYSeU2g2gUn0P+nWj+eQOY+7fjdVlguI6nFgm9V28pQyOfbKSx7X
	 DzTFtuzYVvpi4bGiK4iocR1T2vNbWPNryDIEGmZn325tYu88M2hMkqRJOK+KJQV2cpaP8
	 W0arlCPznWasfRWCgdB2qvcG1LZUBYZb8sduRzWfH5vF4lyhf2/v6j+xaIAzlV3exaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795874047;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=9mX1XwkpZzZFlEfmqdehYAaIQV9Aq1Y+dGqXT/HOfNg=;
	b=uPK5R8TdrnA+qxlswct5Ct6i0a7QMFnMnsJVfmIqonDq680rVH06XFL1oGVzVEdLmdbX
	 3FhO0nvoqS6nvA5EcJT2SAuNPiWuJFP1RqLE3kEp0J/Z3VNILbgHBP+KkJcoZN7FXsP/1
	 3W2/peoaeaq2dHTW6ZjXradFfjpWyDQOw2XJEAeJt4TsmOjve7Kvat8TAuMWiihH5s0NX
	 rByepT2DpBrIM9P6Zc4xgJladIFZgDg2t+gOF4Pj9m4gGECsQbbqDJAuxTpN7UuozZMD/
	 fxxdSh5zkRA24+955xeH++vY0TxADYzUY7kgEPobIDZuh9HYUQ88SLJE3FCAJKV2S+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qi2hXA7x;
	arc=none smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F712606A324
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Nov 2026 13:54:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F712606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qi2hXA7x
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5c14f3dab09so4398800e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Nov 2026 05:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795874045; x=1796478845; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9mX1XwkpZzZFlEfmqdehYAaIQV9Aq1Y+dGqXT/HOfNg=;
        b=qi2hXA7x7wrRxNS2ksI35vF6o18iVAI3siMasQCM0/EIvffM/SgAi9ZV87TC+rfFl+
         H5C/YM1XB9Qut/evinyE8MGbSoyucEesjeEw1HI7Ta739KwyxudLpTEblh6MIA3s+WR5
         +M7pCyTPFnJvc1NOGc6orBtpamkbWmSz03k4L26GfbeDECZPji8MhwOt8zFRsURVKAls
         5cLsXHTN4w4d3Pp/ShBy/VwZIzTV+kfNVMNj17HuUUMXbgKdKYPb+Gh4sqTWys+zQDN3
         u8+76dz5XMoumQKDrnAt5S1X3nDr0XG9tn5EtHgTikDZ8poG9RP7jcRfkfIablVyqSj7
         1P5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795874045; x=1796478845;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9mX1XwkpZzZFlEfmqdehYAaIQV9Aq1Y+dGqXT/HOfNg=;
        b=QO9mpRQBbkAN+RiEaLVxCkGw2Ux0SF4C/phmShhA4DLE5JOSiEL9P0NK6MBmyQ4evm
         GVLzjKN31bScvCQN+vfDGsG9n9LE9sw2tMGkEoG5tgX7I5wyvhxU+svjhrNnch4frkeP
         Sz0APl911VFI4B3mLaVNJmtg0Jt+xqV1Du/SY7CfWdGWBeeQPJBCjTKDBR/IjA0aAgLh
         kSEVg2HpRXGiQl5Uqdsz7RvDF83Uw+OGhKSzRbPN4Q8zXfZJwHvo8mvgYcS5i0GYRqWe
         bpThKcaRtEHGDzQqhIveY2pcQ2bgKzg48LIe+kEAtGv5EuJ35okgujjkzJyK0DoxgpgJ
         Nq5Q==
X-Forwarded-Encrypted: i=1; AL+hErEh6T/5i8rik3TuFv5TXbUmAmrIR0bTV/iHEzetlyA8MGe7FCIM2Y2FjNZsIPBtvfmj55VEnj3is7oYByki@vger.kernel.org
X-Gm-Message-State: APuU4Z/eZ3yTgclveXNyzGbctB/HtJ0S1PKYo3sGDsbRf/o8taFeC4Vf
	KTJSPhIQz8GpxQFw1JShirgfXZ8dlOSllBQKbULPUoKXLTNM69jvWf5u
X-Gm-Gg: AZFdTZfY2OiHjKUFFEeKWe7gxgqzQSCG9mE6TanlzliUN4LLPBpCA7A/wxW5ft2wsCR
	bhlKq6tvH+WYBwlZfBaUWBWttOZN0HzM2fE24DK9CSmI+iGO9PsCjgHuc/K4JPXmQcvsDr56Wds
	v1f259+19tHEBb/xiyAfQ227BoyVAYEE9Eo1pqvC6yJRtFPpGJA5ZPz4CA3Tgy8MCFJmFccfc0m
	MvBV7IJFwoHAuCEx2p3BGCaTjS0KFLfsr+M+FW5SXixXPhGHfVh23vkiWxufS5iYlhT/dBu1HM2
	rs6XLAZ21cgjv4f8gIl+gOnBvEdfPSqrGeZA9VXomnuRKEkiSzvHBF1RGb/o6VRUQYvrusU9FHW
	K6q7SJkedE4TP6HUAd3ho0HjTUj7ZNJkjE2Q6HTL+VjBIV/kp+7T+YyewZ3u6iBpazigQaVeq6w
	HL4ZZPW4QQNUnpCHpSHfncPoDSKb3lvyhBzi0Xp6vhXz0Ir/GPPQZy3pfLo3hTkmobIs2PGXwEj
	bYv7oGOR38GznypihxQlhPool0FMRZGBxrY7AN8YYhSmzbbrU0luUxEd/9CgZyjiOuUJFedpiuJ
	wiye8s/nAmHAvo4PAtr/QD2fuecPr9lV1jQKnMZwpkSfNcSZag==
X-Received: by 2002:a05:6512:239f:b0:5c1:5e33:6994 with SMTP id 2adb3069b0e04-5c1bc7ad610mr8583121e87.12.1795874044617;
        Sat, 28 Nov 2026 05:54:04 -0800 (PST)
Received: from hekasnap.home.hekalab.eu ([2a00:fd01:82a4:d100:34c4:da37:4e1c:e424])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcff8bbdsm6725546e87.28.2026.11.28.05.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 05:54:04 -0800 (PST)
Date: Sat, 28 Nov 2026 14:54:03 +0100
From: Troels Vognbjerg <hekatombe@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Andreas Noever <andreas.noever@gmail.com>, Mika Westerberg <westeri@kernel.org>, 
	Yehezkel Bernat <YehezkelShB@gmail.com>, Mario Limonciello <mario.limonciello@amd.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	usb4-upstream@oss.qualcomm.com
Subject: Re: [PATCH RFC DNM 13/15] thunderbolt: Introduce Qualcomm USB4
 router driver
Message-ID: <awn29nfzVzPi-HDM@hekasnap.home.hekalab.eu>
References: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
 <20261124-topic-next-20261116-fsm-mvp-v1-13-a9b45c69cd38@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261124-topic-next-20261116-fsm-mvp-v1-13-a9b45c69cd38@oss.qualcomm.com>

On Tue, Nov 24, 2026 at 21:01:42 +0100, Konrad Dybcio wrote:
[..]
> +static int qcom_usb4_mux_set(struct typec_mux_dev *mux, struct typec_mux_state *state)
> +{
> +	struct qcom_usb4 *qcusb4 = typec_mux_get_drvdata(mux);
> +	struct qcusb4_link_req req = { .usb4 = true };
> +	struct typec_thunderbolt_data *tbt_data;
> +	struct enter_usb_data *usb4_data;
> +
> +	guard(mutex)(&qcusb4->typec_lock);
> +
> +	if (state->alt && state->alt->svid == USB_TYPEC_TBT_SID) {
> +		req.phy_submode = PHY_SUBMODE_TBT3;
> +
> +		tbt_data = state->data;
> +
> +		req.cable_max_gen = TBT_CABLE_SPEED(tbt_data->cable_mode);
> +
> +		if (FIELD_GET(TBT_CABLE_ACTIVE_PASSIVE, tbt_data->cable_mode)) {
> +			req.active_cable = true;
> +			req.cable_legacy_tbt3 = true;
> +		}
> +	} else if (state->mode == TYPEC_MODE_USB4) {

While testing this series on an ASUS Zenbook A16 (UX3607OA), I ran
into an issue with a USB type-c display using DP Alt Mode.

TYPEC_MODE_USB4 and TYPEC_DP_STATE_C share the same integer value,
causing a DP Alt Mode request to be interpreted as a USB4 request.

Changing the above condition to

	} else if (!state->alt && state->mode == TYPEC_MODE_USB4) {

fixes the issue. The display works again with both USB-C ports.


> +	} else {
> +		/* Do nothing for e.g. DP altmode */
> +		return 0;
> +	}

Regards,
Troels
