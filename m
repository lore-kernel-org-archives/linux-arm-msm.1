Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794744454;
	b=LRvHL5KQ8qpZq8XNlyQxkYZNRXti3wmPSxTFMzKRTIIIj/bR8TsFRmyjYLt7PmgbzWjg
	 to3m7IZLAWtrkBpXcYCc51Ord+SulAClV/pe+lgBOCXYToTaC0bp2gGzPwAHyCX/1Bejs
	 iygGvMlp9KkSHPmI5cV+F7mvLH35SC3HmPEFf6UfnYRPjGeAHi1dwBmAaXPNhqozg6hyj
	 aJArhEgKOVX6RlBJae53TKIVYAf+LJje5C/vraNI4d9y3+lpyX73uWMV6jTqk5+zW4FUQ
	 HP0IFsKYJGkeT5KFit8Owns1lHebYS+G90oZ5Tuq35EIxKioJNfdCayRZuRySBd4t9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794744454;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=r6K5yPNLQHHB0Nog8TnybL0n8K+O6sS9uh6jOz0Z75E=;
	b=ah9imh8MAF3Hnz2RxO+hyZLfKkiIFbYfSlSc+m3EEEtk+PzSD3aeh+ATUWA7Q5xkbg/d
	 tGMf6Fib0u8nB//qfreZfuK1PIcC/T+OKqv3UMVeUdh6JRnWqCuBkkWjlJdvybHQ73/3u
	 SFau9ibkmp90VHfckiakZUKf/9Ers9mN0zpJNKZEqVC/xG2sPBV8bR7D1IGJVSmBOm6j8
	 d7SaIIok1KcSPZMP5i4wPT/thKWq1r8KBzD1CJIMIE1PL8f4rlr5TBOv0jyMIu9jmQb+2
	 ZXf8lOMV0GUxY+j9lj5nSY4ThpzCBB/O5B/t4S00+4JcXh6o+jXdtUCTM4++x+3Ofdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ivnCHnZa;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0D0606A31D
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 12:07:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C0D0606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ivnCHnZa
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso18147445e9.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 04:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794744453; x=1795349253; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r6K5yPNLQHHB0Nog8TnybL0n8K+O6sS9uh6jOz0Z75E=;
        b=ivnCHnZaftDoBq4Gu8kkVFXEzJgGlSRM+LgtFJVDlwfFAb/n3HudZkR736adgQgnJo
         ytYa2blxe4Py/DJASfqDUlFkMCck4XodHVmszliN+mxK1P1sXE5p+NVwnf90ghioz0ct
         5X45X8tkFPDaTUmpOO3RLQ1RZTBvOCS93yaN2xwsw5751TvRzY4y2XhuaPT1zW9IvuIJ
         cLviT9GDTLT5Yr6iPOmFHAScweTYW3K4zm3ouhq1mL9m9vmuznAgU499um/26kIZJLdo
         OvYCeppsIzJ7QBnAVNOfhlt8PxTcbnxf5+SWgLmRGkm26V3e7O2aqmyGCum+rO8SW1A+
         k7kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794744453; x=1795349253;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r6K5yPNLQHHB0Nog8TnybL0n8K+O6sS9uh6jOz0Z75E=;
        b=1fu0JB7g3XJyvDVrDZvKrL1iPJTc0FOwGn3rwt7IluC0uuVe8IxPPHe+1xeECDbG0f
         WlMRXiIPFwOBtjh3Eedw81kNsKq+KsIdRC4A9Ym5flvCyW7lcmX/UxygdZPE8Va836mR
         ZGIC62EhcT/oU58g45ZAhnRX3Kgu3KlzBulHFvlvIlJqSs/Tp91J/trOMbWF9Ndv1pa7
         RdDlCKUeHC1eXEiVeI0sQfqReY9TAroShSn6Emev7WSl/cp/9qnHgaG+IiQi+vv4iGDX
         K1sAKyehfmfYF1ryxea6fWwNOm8SPTy8Pp6NN42ddl8vk+vSLcfSdX6IBfjDQ5H+6Ioc
         On4Q==
X-Forwarded-Encrypted: i=1; AL+hErEieLnYwQK8MesoUZfAfaYZYklBGBFbCjcGAMLUkMDva6KYNl33sshPJfzamkQzbUqsn+LvpmE3mk8Yl5mo@vger.kernel.org
X-Gm-Message-State: APuU4Z/BTqf9s6ygjacp4bc8RnAHV/gKhBZJetrW6Kvzu5n0iORwhJ5A
	7VqNn5UZ3z4CxTLyQrESxy7IgeCrg6PP6dTQT9HXJPhE/Qw9CEBYm9RANCzOZpW+rPw=
X-Gm-Gg: AYBFou3iyrrrEAsPYs4aUnzV7XoUZW2wqMHf/S4M7cjxyUM/ygmhklCNo2acWWabFQc
	Dam5KO+Bz2DAhURf0k3WKKi0wX3adj+KLx4kq+m5aOACsFjYGVMVzNVuiPByXv8+AJn+4Ew8Ar7
	/1PiuR+Gvvvz+UsE/qUsVbAcVdBkvn2upyScJpf2uWyoUdLNIa6WE4YhGErP12N8lOEWzcjT2eO
	hBg+IQNVYOJ3Bsmmas/tico9Or8svjHDoM2qvfI8WJnjGzIO7Sl9TLG3kC+MuihFuh1YjnU78a3
	o1D7z5fgrYnM/qAfMXrmCfzbTSGPRLfJLSKFrOE/ssvZ/QAoIbWq4bxBZqVEWHapFm147x+umR3
	4k9yYhv8KbNOptKvY0gMw0SwQy47uQxZUrlxiEmtslG2ectQ4SJnDV6qVz0GqOB/RfuASkwZwYr
	abhHatA29SBdE9hQINh6wfB0GsuQYRv6H8uEWfwnJVZGwDaSXumCSkUnPuGyOfRpsMg5R1PuP8W
	ObQYlDhYoCp5fxYWyQs5saQUJMvX6dj8stBLDxO4tPCqlbbFfXIE+RTy18bbLPNISR4IQYDJguP
	kes+OsTd/wP65hxcZp4A9Ki87MonPW4UsLeEVLqWniyreV9QNP/uhCbrA8pYPO95
X-Received: by 2002:a05:600c:3d92:b0:4bb:6c01:de81 with SMTP id 5b1f17b1804b1-4bb6c01e02fmr25950745e9.19.1794744452736;
        Sun, 15 Nov 2026 04:07:32 -0800 (PST)
Received: from [192.168.0.167] ([78.152.238.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ac1159sm189440575e9.4.2026.11.15.04.07.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 04:07:32 -0800 (PST)
Message-ID: <d4fcf0ac-571e-4d3e-ada6-a732d68dc18c@linaro.org>
Date: Sun, 15 Nov 2026 12:07:31 +0000
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
Subject: Re: [PATCH v7 17/23] arm64: dts: qcom: sm8750-qrd: Enable S5KJN1
 camera sensor
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Frank Li <Frank.Li@nxp.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
 <20261114-add-support-for-camss-on-sm8750-v7-17-8ff2a11835f6@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261114-add-support-for-camss-on-sm8750-v7-17-8ff2a11835f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/11/2026 11:29, Wenmeng Liu wrote:
> Enable CAMSS, CCI1 and CSIPHY3 on the SM8750 QRD board. The S5KJN1
> camera sensor is connected to CCI1 I2C bus 0, uses MCLK3 at 24 MHz and
> connects to CSIPHY3 over a 4-lane D-PHY link.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
