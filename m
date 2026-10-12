Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662544AAC41
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 16:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791821086; cv=none; b=XGvltQQp36WIZ14y/UTnJq7deaSIfXsXFzCp3zVbghDjz/lznp8ecc97u41ZWwwp0RMShKZg9TEvweJZ2wFFPn4NIL3NySPp1rVS7CcpY/2z0xW14xXbNlsntkkMMtpwYRoTUlYUmYOBmWiXoOxdZ2s+byrgwM/2rG+2N5ULLmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791821086; c=relaxed/simple;
	bh=CjNPhM0F82Wbn9n1JTCsaGj/k6ngpDFON2KbxOAWJKY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pky2D7gu3qH+gpu5EjUGF4l9ZZtC8MSQkNOE86zh9R8Mu7haA9JvIgQB30CQIUdmftGO48hRPYL1LGk/Q/CTzBkm/ECvSYcrKkkNSgCo7mjbD7v/7vSRN9IO3w75ZpSvjjfsA7vyYxSWqE6x99KPFgp/UDt89OoftWzumCsE5Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=E+hLkr+v; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="E+hLkr+v"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93e6fb35f91so203914185a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 09:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1791821082; x=1792425882; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2P5NI99EVME0P3LVAaEWnF0MPg3G/2buC7fzHXtZUQ4=;
        b=E+hLkr+vbnHqrCmBY6XEISAAWMuWV7E//Z13k0cv/4i5hCb/Y4LCuyoEuj6nwqhyHB
         J9ULxntwDLdRJpTYgXpBRDH1k+eeEAl/yNg0ATRtior+9bpgmqpeVSUFaAvDlcbdszE9
         crvYWVYTDZhTj0DwqblpoqoXeN8aSxAZrcp5Wgk9XLx1qr9BatjgeHaJTqbkSVlz5w7V
         1O4eRLFIiGcwy/0IkiPK5eR6fcfev9CtGMRzjGLn5j/J5wQDoem0JJ23WJMNpS//jEKR
         k4AS/GnI1idznuC6VSHYBEn4CQt+fNFACCbbLo92ix86XJ389v8bRpX9fYuBI4Z5cPFN
         +/RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791821082; x=1792425882;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2P5NI99EVME0P3LVAaEWnF0MPg3G/2buC7fzHXtZUQ4=;
        b=Hc91xCO2znE2VLbPFyUg1Qeel9sml3OPgZS9hQzy96loTzpdL6sraYVOjheDp53vQ3
         oi60j/Wf4L0JrxZQMEZ6J7mtVat2WgZ0vCzzC0ZhPH+Jl4CZAUX8paYUvagIutsV30EZ
         tk7xlTJUpHmMn4JtRihhxztm9ux0mq6ASKOHA5LXFg7r9ol0EQ4BlUrYRTCCTAjtCudO
         tBCLQH2lJQ0KA6/VSGFi5HO4UB1l4oXUZX/lFG0Tnrr2SfFPxLWUk3D1AlHGRCvChZ5E
         /dYp7JjUeeRfAXXzqhWt7xS7iWiH2nlVjlM348NN4zPjgn6KdWkA78EYEI6x4l/fMElG
         x5Qg==
X-Forwarded-Encrypted: i=1; AKwUvBw80ognzNRLFxcBR8a7HWp7BBMfAJhtbH1KIuZHu6AL1jozMTshJDxux03SJ9dTbxMbxullH0qOCgfeT4AE@vger.kernel.org
X-Gm-Message-State: AFq9FYLatw2RJtER8VfaAPBl9+xaoytQSgIlhZQc4/sfSWbpqWDEEXEt
	p/B1nv4w6wr1XkoPhZW9yscCjKGK+z1qNb5PboAVd4eHQfwFWqIGwCeWtXck9SnARBI=
X-Gm-Gg: AYBFou0cOKBejSpO1N1DuALNWeY7tBSoiSMXGvHj0Sovqxfz24DRPCoxVwJQJ7F9BbN
	MRfBBJoGm31JrlOvCP28mLZ+xtfrn/3OVrcqRzWYFZgbBz07CXOdzr1PGdOLpSMzVG+1TM/ixfe
	XbZaso0h++Dyf/3/ap0VXhRMDWNGWJDtt1kwe9/FyuqJISGsM74DQjIfhC2vR9eY83rHRLwZH31
	bKMnPYyf7s+ZQt+xlJRW0EzKM5oOlcWTuMDHMBRM/AjlhCcHSLJi6GzI0dCLYG9vtSqoGO3pBZC
	awX9BExZYX7vbcHUxqs7z+tgDfTxvmBrbfX+1c1eKwewFOyiAZ5QuvnhpVF5X5V0mUu7UDPY96D
	cF4HHldTlLn7tXzlK8drtJ4leNVXwyBWZQAUt+4uE/gA0RM8Ss2AsWbm7jvebeODRGL6EpQygVw
	IAlkGZargGNYQKmKMaBlTwZn8wJ2B5hi64PY8mzbNLTqxDWP/Ko4IWN2mFF9LRa+AsmJRO5Mw=
X-Received: by 2002:a05:620a:3720:b0:93e:5dcb:eb9b with SMTP id af79cd13be357-93ebd24ecabmr1816777885a.42.1791821082270;
        Mon, 12 Oct 2026 09:04:42 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef4d31b91sm22701385a.0.2026.10.12.09.04.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 09:04:41 -0700 (PDT)
Message-ID: <ddd1a236-c2fa-4b97-834b-d4c511e153db@riscstar.com>
Date: Mon, 12 Oct 2026 11:04:39 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: define a fixed 25 MHz clock
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, sboyd@kernel.org,
 bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org
Cc: abelvesa@kernel.org, kees@kernel.org, gustavoars@kernel.org,
 mohd.anwar@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com,
 danielt@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, Daniel Thompson <daniel@riscstar.com>
References: <20261012152408.3729237-1-elder@riscstar.com>
 <20261012152408.3729237-4-elder@riscstar.com>
 <51552a90-60bd-4b87-8bc6-080d49e030d6@oss.qualcomm.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <51552a90-60bd-4b87-8bc6-080d49e030d6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/12/26 11:02 AM, Konrad Dybcio wrote:
> On 10/12/26 5:24 PM, Alex Elder wrote:
>> The TC9564 SoC has a single 25 MHz fixed-rate input clock.  Add it
>> to the definition associated with the chip.
>>
>> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>> v3: - New patch in this version of the series
>>
>>   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> index 0e3bbdaf4661f..b8d290eed2f38 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> @@ -891,6 +891,12 @@ pcie@0,0 {
>>   		pinctrl-0 = <&tc9563_resx_n>;
>>   		pinctrl-names = "default";
>>   
>> +		clock-25000000 {
>> +			compatible = "fixed-clock";
>> +			#clock-cells = <0>;
>> +			clock-frequency = <25000000>;
>> +		};
> 
> This and patch 4 should be squashed

OK, will do.  Thanks for the review.	-Alex

> 
> Konrad

