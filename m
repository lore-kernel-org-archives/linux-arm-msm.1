Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795642486;
	b=PUa4fFQ62uB+48TizsDZBl9jNEL5RynQemVpONrlD9eR5a7ZSsrHgqEHaUQICK4/PfDI
	 6SddW+iOjFSYHuPuZ9Egr5MfFCYJIy7Bhib42UH3qxlrV2S9HOl+UXfUZ3BOnDJ3+gwvA
	 bXpfE+Kfd2WtY48Hv5LYJLXvXt8f0PpLyKrRLgSHthSncTDfR23wJXKhwHhd90JaZvrJ0
	 PppLNvsYsnAHs5zlW6e7fiVSQNf57ryc7f4x8+4IjUGt9gKvQ/eJONTq7oJdSDkDiovXV
	 D5+n0AGr1trta8EOv1BTjtzZiiaBdqFOHK6GdrVgsmZPq2+LoFS7oyhlWZqV9HQST1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795642486;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Csrc7807j+0cWIekbqjS5vryeUuz0KEVG4hhcz4IF4M=;
	b=ATVN9p+kbqBABQDVrC8Fr0gGSzUR2nyJk9pdXjBZ0M9AgjLmN89kf+FF2I8M1fDmxszf
	 kZoKOHnCA/QdHS6TT4//ly1lcRnRrgNpGqAY2yD3hAOSe+heJiVKNTaf6HWatuAC7i9p0
	 YLCYUKIJMnBl1kzu5kB2M7dWXPgqEn3j3EHhD6AWSiS1O5QLA1a7JJ4aVYb3p09X9piGg
	 jpWzou2Xd/AKeYoKXZKmSizlb6ByIv0zNo+uVNV52ItPCZuNtCWEHFS3PHaRLHDhXgoO9
	 t4IC2zYm8bVGQ5qMkYLRoNAG8wOZn8oCZ9ffQsnXYwOprsq7fgdmXsFOD7/e0Tlx7Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dS8k2F4D;
	arc=none smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A4D606A31E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 21:34:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1A4D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dS8k2F4D
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5c154a41f8aso488975e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 13:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795642484; x=1796247284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Csrc7807j+0cWIekbqjS5vryeUuz0KEVG4hhcz4IF4M=;
        b=dS8k2F4DvQC3/cgxLCPBWOV1XWpXZs0BO3OCHgGMWCYVCS1cvxa6aafhvcNPmsispj
         wfwFYca0+sFFXp5+qzLJyn5n/YBIOqmEGVV6ySTu7W0RMPETJnFEDZulIhOa2m1pUPUn
         YqPq5QK9Swtr9w+kuCB94g5i0XG57g9pd/a5+t3pnsSxqEUzvHrCd/bjAvtmVOSx4t58
         As3ygo7Q1kdfBoxziqVsq2pzpP6uubpIwJYfjZ8zqVn7uJ5iFPUxchZrX8DDYp0P5b/k
         NYittQLqPYbbNYyhiMACH3TX0Nh+DIPAL9VoKe1j4RRv1ckJyogDtTvelW3Mlknmnw51
         7lEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795642484; x=1796247284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Csrc7807j+0cWIekbqjS5vryeUuz0KEVG4hhcz4IF4M=;
        b=XrHgboHbsxVgKMgX562+H9GPjA0NgxzeyvZsYNDhebZ48iYE+p5dnAmE8EJT6vDBrS
         EAXW70+6z/ouKcaqO0OVQl/PONo4b94M8J3OnRnGdOY5qvrifwnIJZA/yFNsBOyDAa2O
         hS9V+1yCbZ2Ip0Rn4QuebqOWBZvcl4GbuXmXbI00qMNT7FKno9kXtyDOJ07sZrdMmiKf
         53cCjxgy/w8ROpLsA8tUArN67FJdS8PPQ1WaCV2sx+qkWPbgX9eAuBHfutILLJTkT7+A
         maTzQktbfiOkCr7ej/wxa7z5EVe3PY3HLGor8xjz2rp9l6tgmMKMQqY9nlbVoVZQQI04
         UEfQ==
X-Forwarded-Encrypted: i=1; AL+hErFcBxXzBH4UPr2HkxL255Eom26qbPJutWAqugg6AWlEOwMlsBe7qzulfkNfGHfjntaFUl6ng/yPSUs/w5ZW@vger.kernel.org
X-Gm-Message-State: APuU4Z+2B857VmSeXgb+VT7I/0Py120JVvrz2S96QmtWicpv7t8FUV9i
	T5r2H7PUBQYQ9maDXdk0gbpk77OAAm8jJ1rBtAOkE88bpuXGguf8W0INS8Nt77m+9z8=
X-Gm-Gg: AZFdTZcBxnBEXEBNcW0y6KCckggztJ4wdFBrzIglFMGsgDwpZAnXMZqfeQX2X8brbys
	lL7pX4rC2lGC4VYELvSehWwV7q0hi9O1MAe6bv3FIbNMQA7LS8P2+rM76TiEsAIbEx7bJjZloDi
	Ku6UIzYL/lSczpINTXBhwjWCaqDCKrFbW6nd1jK6C0oiyrFNTEHWrK+aohz6T/EZPq/fISUW3gJ
	JwB7uyMurj6aAnuWKjyKMw77kl3ddPDYOD/ls89O0HnfPt01lEJ9rnfcqCjOU81GcTENG6KhZ4b
	ERTVMqXBSLPmVbdAGU02z85cNQNU6jyHAdrgp+Xj4FfT9vA3wAL7LLyUeMt2aIf4Oof4VN3UCWP
	lhyTtfw3jLroo7xb+g0vkHVAowYJa+4/XvCsXwh7cN1PaYKMMSLQBHq28zIhSgZryXWRb/rwfds
	yCCNQJ4HiYVIBpbxxPDaAgWYPMhOTzRsWFs8L23RvZOl1eVjqLfvsqFhV41fPPkVETbHZlx3hVD
	ulzb2JQ1bPNbZla2PJDJvZmP3TZbk1kU0gWWqK/qbbf/dl9/rax1ySnh1B4xKc3mUUs9eNPQAyU
	lNyHo5QV9lx+JZrdnX7ItmXGcOaD03TN2xJc6ZUQZW1hWSy8gccjcbv1K+0whws2td0OVZqMnXO
	Zv9/kjPLtN6J44Go=
X-Received: by 2002:a05:6512:b9a:b0:5c1:7a17:6f69 with SMTP id 2adb3069b0e04-5c1bc7deba9mr7578888e87.6.1795642483852;
        Wed, 25 Nov 2026 13:34:43 -0800 (PST)
Received: from thyme (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcf3338fsm4845422e87.3.2026.11.25.13.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 13:34:43 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Melody Olvera <melody.olvera@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 0/2] clk: qcom: Add missing post divider table sentinels
Date: Wed, 25 Nov 2026 23:34:31 +0200
Message-ID: <20261125213433.1438537-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.53.0
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

Two Qualcomm clock drivers have post divider tables without a sentinel
entry, while the clock divider helpers walk a table until a zero
divider is found, add the missing sentinels.

Vladimir Zapolskiy (2):
  clk: qcom: camcc-sc8280xp: Add sentinels to post divider tables
  clk: qcom: gcc-qdu1000: Add sentinel to GPLL0 even post divider table

 drivers/clk/qcom/camcc-sc8280xp.c | 9 +++++++++
 drivers/clk/qcom/gcc-qdu1000.c    | 3 ++-
 2 files changed, 11 insertions(+), 1 deletion(-)

-- 
2.53.0

