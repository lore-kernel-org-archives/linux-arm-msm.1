Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794360444;
	b=nldmGT7CTWG9TIS212ybAPhpWDGbYzcrr18Gex+8wXofD7Ew67jcjhTIhxqAIpzdEi48
	 1n+AFBSD8qt6hE1KUvTGiCkFJwpC4aDG9oVmqQHtxvL+u5TKpVN1qFVT8TDLsbVdzZV8s
	 XrNFEBFzVjyLkg7rPzHNosQuNEyb2VyrT4Vu2xNPCb5sshCEeP2+eFBWgyOfQH8krUxZL
	 1ylfZF353nEByp/sAmsYH0TcVpovVO7wVWH7r2vizDJ5vb7y2V6D/cu7xIMl2Kjzs1e98
	 E7TIBadlzhDPdqX/aLptNtBIGdowXC+kTLiyMyktwQy23BrL0/5uqH9H44SVFUyciIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794360444;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=BLSB0jc+PDfoGDhBATE5rNyu65P6DKBdBa7UuDK+sb4=;
	b=ZlQzc6cd17k2M1v+NeIlsxAIs0stZv8ltNZhE7Lylp+uRaZcHWPfL5BL7RLdbatpsCqI
	 1ZEJjgsP64fPYaZiKxnGI6Jb6X47XpXS9CxCcbu2H70fouAGod6y24xS3TRf84xktgQsN
	 AzBP8htK9bRLL7rmmQ6ZMvRLJiCVqv7IXCGAyYDuvvTN8Wjtq1IgIvVYjcY06EoZHxnJo
	 Lb/8fttGcx5zhjnUU/a/PcHwLzXmdSyi1DSe0GQODLJLlwnksow4Blr/4xIx2y/8SWOFJ
	 moG1b0fE8ysukprNqX9Fz/Acmu3iq94XhrO6sCSxbe7nWkuGQ5GqnivVxi7/x2db9WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=andrewgigena.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4048606A321
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 01:27:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4048606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=andrewgigena.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so5288175eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 17:27:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794360443; x=1794965243;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BLSB0jc+PDfoGDhBATE5rNyu65P6DKBdBa7UuDK+sb4=;
        b=x4cnB9kVuIQ52nUvaP8MQ6nl1w249Zq/EgaSrRcKqnE2bN0kLJIHjBCE5bJirHBh/6
         0xgC3+i9ankeCz08pXYYrDathgA+uiAFd0dgPwk6HDl6N8vP7WlKKB3b6cb5dglnLlTC
         cxn2TrwnbAEJMxKSYklQ9+VkvCIj2e5FD4e7JtnrCZN1i92og+WAINAzkfx1bpko2H6t
         lYaHza56DnUgjSsvoLEwKJi2oqXPt5c27WXt7sSAOBQ+j5ini6H7vOpHmAW107Ql75FY
         I0L0wf/BKiscyKDxXuC4jgKZINrAkB7ezzLXBt2HbXrnCk6M7JRA4xq18HbZdnGgKR2g
         IInA==
X-Gm-Message-State: APuU4Z82l+Ie2x9oWLSYU9UdtdDTBPBb1f7bvBVLRfveR4NlGS61LpfY
	Stw/d/7S+tKJqGg0+0FeLIccFG+hDP0E1pfYbJoHTAsKnEjmfSDDB/Rd
X-Gm-Gg: AYBFou1i+G0NJOe9EqbLCzaQe8vJujZTtsmYKT02qznGIQaLDpuDzvpnLKY/ae1uwkX
	DRAHddkSEBYk5qk3zj/S532RbcizVRRpQfBY/aDJ013OiHvI2WQYsoi8PKq8hPC0M+aUmgi50zw
	YLD5CaLaJa/NOFLZeSAV9wkkAwbVfWix1dFwttAaEjonBhiWzfT2KM9QbPWbrp+H2dybCW/xGQ4
	sfTUPhScAT3RK0MPmEJIRDSGyb2ZRiHPyMbD6Sduf5+vHQEeXvdRpAwJp27FHVd7coiIwrDG1Ds
	sbE4Lx5bSKzaaHbnCky9cdzzoB3FCvKJUmgknInZOlWPO/vU07z0kQDc90FPiv+EArXpol3KXBP
	VK8Yr1DwRx65mJn7Rs3lfHgwo/2qxySXRnZYF4vAi45dsbz4spCUJhCOvOlZEwET2MAtlUR0uJ9
	JwgLx/fsn9oQ4D9CfBe3es6m0tsfVdwwlmfJIExbGjoiBnuhkjN/yHVGXUNBABpQL4g5J2xMm4i
	fjyGr2AoroayMUcms3n8+5yxZeQnF5daZ2173KGA6uxQNGRTMu1ccnVM0IO4mLTx4bZgCRn1Tg3
	6irwF3xF75Qr3Ml261oWQEuoadMG6+x1ciUefv23E8OAW1vzOc/Iut6qMR23CyuOn7bRaKQi
X-Received: by 2002:a05:693c:8219:b0:36a:1008:5815 with SMTP id 5a478bee46e88-3768385dee6mr1611656eec.5.1794360442766;
        Tue, 10 Nov 2026 17:27:22 -0800 (PST)
Received: from ?IPV6:2800:a4:806:ef00:2f77:7097:372d:6d14? ([2800:a4:806:ef00:2f77:7097:372d:6d14])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e7d24sm16548467eec.22.2026.11.10.17.27.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 17:27:22 -0800 (PST)
Message-ID: <9988b8c2-547e-405a-9c76-a4e6a59c7dbb@andrewgigena.dev>
Date: Wed, 11 Nov 2026 01:27:15 +0000
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] media: qcom: camss: Add support for SM8150
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org
References: <20261106-sm8150-v7.4-rc1-camss-v3-0-0103e8a0bbcd@andrewgigena.dev>
 <20261106-sm8150-v7.4-rc1-camss-v3-5-0103e8a0bbcd@andrewgigena.dev>
 <160aa94c-c726-4cfe-b8cc-b1f974b32f13@linaro.org>
Content-Language: en-US
From: Andrew Gigena <mail@andrewgigena.dev>
In-Reply-To: <160aa94c-c726-4cfe-b8cc-b1f974b32f13@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Vladimir,

> Drop csiphy_res_sm8150[], and pull this:
>
> * https://lore.kernel.org/all/20261026224957.1115370-4-vz@kernel.org/

Done in v4: csiphy_res_sm8150[] is gone and sm8150_resources.csiphy_res
is NULL, so SM8150 goes through the PHY-API path and clocks, regulators,
registers and interrupts are owned by the dedicated CSI2 PHY driver.

I folded your change into this patch instead of carrying it as a
separate commit, and credited you with

  Co-developed-by: Vladimir Zapolskiy <vz@kernel.org>
  Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>

ahead of my own Signed-off-by, plus a line in the changelog saying the
fallback comes from your patch. If you would rather have it as a
separate commit, or want the attribution worded differently, tell me and
I will adjust before resending. I am not enterely sure if this is the
correct way to cherry-pick commits since this is my first kernel contribution.


Best regards,
Andrew
