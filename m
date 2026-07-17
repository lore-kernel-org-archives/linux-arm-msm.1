Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB8C3BD63A
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 22:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784326918; cv=none; b=ntNoFAH49T/M/kNB2mPWBjH6gWO//L5BB51U70CBBxO6yHcPcidpWBeIs3de8GXWY2k1ttjBGNTNwmYdClNhTa8sWYVrsOS0GuvpTgfI6/6peyvdhpHcEF5ae0vj8NZdl0FuhD5+gW5wFsQtH6YEhZu38Bx+HEaYJcrQfxHvsu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784326918; c=relaxed/simple;
	bh=Lr2GTmMh9wuduPyUMz9X0KgTMet0vw72GnJfELBArNo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HLMmzyep5QoEjm+QkLNChWnVIO+WmhSteCT+1Lvr3AeZD9mFbW6QBcE9bKI8/5QfasyMP8Z5cxO5uZ1ah9OYw3cpAGxWm3NK6/Wzc285pCIYEIH5RPvebtMJmCk7Io4hJuU+RQ6+JDaSF5HzK3440sZHBgQV8bQ2avGO1tV1kvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aLKR+Pzu; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aLKR+Pzu"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4954c0833b4so5863495e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 15:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784326915; x=1784931715; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yScwpwmBKpfi8wj0lw4TvJs3n46Ct7Tg5oNtfrudcZw=;
        b=aLKR+Pzucg1kq1Kx3SClA53HYqOmXoSQyJ7bCAqSeJGleJyiGay5+OWbRM+gEpeL/J
         B3c4Sv7len9ti3nisfJM+UgXrktrxOUFVwOWl3P+9H3e59RF9AtgNhSDwNNzJg8VYQem
         mv5Mp7PN8IQLRlzpAh4FUZQ12GAnzNqLUftDepDgCU+ZAxKQdIYrro3zejTE4vNbhAVN
         gr0qXySOkL8j12/DlE0ZMIkmDqKgVvJ+xWEsWvCy75qcVQuEftIoFtpObxo8FSPld9+0
         cETBuco38qeW2XxcmP9lA0axs5NvjOByLcsZ4a9CeVcOFqTsf4rV8+o2f38D+FB2dNvF
         2JhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784326915; x=1784931715;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yScwpwmBKpfi8wj0lw4TvJs3n46Ct7Tg5oNtfrudcZw=;
        b=kpdaycW/gExCTwCq6I2aKysm9bjsFmWtnUVN9GQlfTPgwhUEGv8paLM1lgDKKz99O7
         bwMHDsPo2GSjP3mg+0xLam6mGEOe95eoiyzMOMaJAsGF383uHVl+gzd9EH8pPwvuOUxE
         Y51cSQQxrM9qE2T8/nDnDuGxMmNwzXKTQFaspFON7YrY3j0myGRJCQUigc5Csw+G3qMN
         5C+RN1M7KSDzI9R1h2QEq4Q6l1OyQWid+hZ8t4rSOKVWcNfmFMc9VaE1z7p2ebRARPGV
         w45ldryQvR4u/cF6O7UMSx+xGvl+SVeGG9bsnv7Xw50uak4Vs75+qu+kUCvCEEVq3OJ0
         e8AQ==
X-Forwarded-Encrypted: i=1; AHgh+RoTTXfaia9KW3TZiVjkF7f+fR/olIo8vi32q/T1EtjFuwnH//Wqc74MA3ow0b9kf/lmi32FoQ7AcAL/xrIC@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt9f/xRZYS5Aacaemvjn+pCXrHEO5LTCS15yfXP113juop6FfS
	8vYArjaQUID1LcKwZyjbaKo6p75iSwrUQ9zinLg5HzOgE9YQr2SFgb6K2ZCri8f4wmOSu8k/V/+
	9bbbOPJw=
X-Gm-Gg: AfdE7cl3cCXiVr8ZHSs6EDN23A6uzKYutJV0e2Y+JwZI2KI4PXFUTnMXT1Cb93FFHC7
	SkAqwvhU3ILaD1x+uh5RvBdq/QEK7haSJ0vjA6L01El/BlJ1FS7cegsosdmMstfFWvybng7Jv4b
	6mOa36ophijyNYRUyhj94EjtoDjbKEbRUs3UzxLMGqTUJ3vo3y29HVxe/tw7hLnCuNYhiO5/VG5
	mnhhBqTyuhoFyU5SmUi88CHbcsmXMzC69nlAc6irSf6gb4oGz1YpK8BOj01/bKr5KB1dr+sCZTU
	VzR5taUEV1/AqBdZEeWnlAG1esKAOMr80+OUFA+/096hAm872slLYBVUgVBvneSvkedy5GOgM02
	GW7EvgYYmIzyhl19jpcmqrOwBFW85Xs6UwAoy6gfcayzLj4JtZ6DhTi68yGkyEAUIXprswjsGjW
	QFIqQJTjhOR6Sj3TPlWXC2TIoK
X-Received: by 2002:a05:600c:1989:b0:495:699:84ca with SMTP id 5b1f17b1804b1-4954a798f17mr45458575e9.28.1784326915351;
        Fri, 17 Jul 2026 15:21:55 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.30.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954995b78dsm52586385e9.0.2026.07.17.15.21.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 15:21:54 -0700 (PDT)
Message-ID: <eed3783f-86fc-44df-9709-ed717fdf0819@linaro.org>
Date: Fri, 17 Jul 2026 23:21:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/11] arm64: dts: qcom: Add x1e/Hamoa camera DTSI
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
References: <20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org>
 <178352261564.2235436.11540452339147753406.b4-ty@kernel.org>
 <5aa5487b-67ef-448f-8975-0c46ca1d3451@linaro.org>
 <e1b25b3c-ff3a-48f6-92f6-a81f7df24e54@linaro.org> <alfzEnd10K2kPjwp@baldur>
 <alqn705VnocjAGbW@baldur>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <alqn705VnocjAGbW@baldur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/07/2026 23:16, Bjorn Andersson wrote:
>>> For example: compatible = "qcom,x1e80100-csi2-phy"; is not a valid binding
> It doesn't say anywhere that I merged the csi2-phy nodes, above
> ty-letter states that I merged the camcc patch.

Ah camcc - my mistake I really thought you'd pulled in the WIP stuff for 
CSIPHY etc.

Thanks for checking.

---
bod
