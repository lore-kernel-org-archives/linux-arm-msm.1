Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9120149C4A0
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 12:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788353522; cv=none; b=VPpEViBGQmNiUpFA+PO0neDqzVcDhfTkYVxsBL26gxgN9rJlGyyoG2foS1T0nVU5XNT+rD1rlUNk4lywMjMrCDU1QtkdCjLxiw3GXsmhpzkq9lknVdUMssT9ayGWgDQBFym9UPuk4xV5XAAW3VBIjoQWiAw3b/OeJTnz25DIadM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788353522; c=relaxed/simple;
	bh=mKlEjK/YMQld6vJmwR0/9aKJoS+2zsE2avk1GfXVXeM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FJBUolkqFUio1TKRfHK+h09sHnym3mDt4t5D/pNG8a+xlZNp+31a+ADeP1KuLF8kp5kKJhzz2EDuMfXNHZESC3kWWOF6A3IcfPhbBXfgJnW69b7EAfUhbt1K8ZBTIpD5t4SdbZtexNX0FLIll6uZB2Zuc+d9cZWNNu8FpP6Fh4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=a+MHFUdZ; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="a+MHFUdZ"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-52e2d1bdbc0so6847391cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 05:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788353516; x=1788958316; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cBFYRqjj9ZQem2jSgP0xTqH/Yx+DXsxPz53X3PniFy8=;
        b=a+MHFUdZ6flYrZhivX037uuPPoYhghpxDukqRxHeebP5q7xjyKw/OrawV3VnxJSBlz
         s9ad78FxrrrJlbWcV4Vios7qOXR6bTRzFhekDv2bQkZO9cObQma8tATetwGRmbRXpe1K
         cE7vWkWhlicMtwFKJgZ+/Oh4MaxC3V2vkj3MrYDN+Uperp0hMg7Cp2+FU+LPaYD2nKdD
         mygDm55U5+xhqCDtUuk3PItiIeA2hpWfotakp1IsXUg8XaOe92sN1Zx5Lt6p10md2O8B
         yqOSZDzjtT3Fsy1RGkYs9xFHutwwRM5kuLNyRAdnDiYE6HsJA5zd7A9JXRsclOE8XiMt
         BjGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788353516; x=1788958316;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cBFYRqjj9ZQem2jSgP0xTqH/Yx+DXsxPz53X3PniFy8=;
        b=HKa/SygI2VkLPs7oP6XaqrtfXRi7HuVVjWmsznYibHRY3B3XKRlhv1C+cpPmH6kLNC
         hZoEYGveW8Dx2oTW4HvAncx2uXfCjcGVQrN+gcHIa+8pR9K5RGcrZWbkAlcDS8cUuel/
         U3KWCS8FHxOPpOI7fCRejxxTFUHqR7dtZnqFdii5q3i5u6Lr9XZPupinrpUf+WUXpKJA
         Mt64rk8V1oVKcGJ52fMpms7gYGCjEN5Y6/GOv41K8501pij0TF6Doz+zSQBZYcSzMmUx
         mC5gqkos7OcSZND/tBNdTAbkgwd69KvpqVmfY807nSwpK6Um+LPYLkI4lnj9pRFSNHUA
         TCUg==
X-Forwarded-Encrypted: i=1; AHgh+RqFJNHVqvHlSf8FHdntf/FnX2MdXPbD0uGvJTeMTNhNot/V8LrLbvclBUPmsyPQYiD2kC0RgPYr2ULGDCIJ@vger.kernel.org
X-Gm-Message-State: AFuF++n+JtjaOz6A7hixDb08lxd/5+iTVbuVnVId6DI0A2vDTvcVUrb2
	5+TfudX4FFEDTqS8auNjztjgq2WaF94SSXmHZBF+UMCLnJhayRQ3sdFb5wSHfX3ze28=
X-Gm-Gg: AR+sD138G3q8xhyiX7zBPd2/FAKHsGt+jztIxLCL77FwF6LccO4ZAq9Vi80o07MTFX9
	9h37n/8YFMDupo7J52E5yWkVTZsFC2BMuDk7v9X+1TPqNEGnyabKGYk8RbGfauU6a8XNNc8pLH5
	i1E0yOXgRO2TTuUrykAecGA2TcuneEl8IKFXbloTeq6vUQCqn1aKlw8r5Kpks3h+QKTlbaJl4Ll
	5TZ1a/RpF9iCfS1PI8ntSKvwoMQlPkBOf/HMmVJYWOY4EW5JYaBQ0sM4KrvQA03YrKBeOKJewUc
	DNYwD07/E2e2tqb1xvNY5o6yuftwLIg8OlUjpquUi/CxQoY3y/HcU4DGncPP+9hLlkWmDGEScX0
	bCOKcZB0JjHEjUE+CWvYwItJCrfSHHOqeWqkqaVFr/FrbxKaLyE/PZi/uS7cPRcGwz76PfhKk+o
	m0I5wP16jiJu622wSuIdPEpPW1gD1tDKbIMzLH7gsmQHk9pvHSxL1VkfgyDdGVyQ==
X-Received: by 2002:a05:622a:4818:b0:519:8998:661b with SMTP id d75a77b69052e-53036cc568dmr52347051cf.20.1788353516104;
        Wed, 02 Sep 2026 05:51:56 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9eec824fsm17365906d6.24.2026.09.02.05.51.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 05:51:55 -0700 (PDT)
Message-ID: <d9071ec7-371f-4896-a023-77a07f01f65e@riscstar.com>
Date: Wed, 2 Sep 2026 07:51:54 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] arm64: dts: qcom: qcs6490-rb3gen2: use pci for device
 nodes
To: Rob Herring <robh@kernel.org>
Cc: andersson@kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, daniel@riscstar.com, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260901172058.1512508-1-elder@riscstar.com>
 <20260901172058.1512508-2-elder@riscstar.com>
 <CAL_JsqJJPdrYArNhbRPTM=scDghLAWe5=0a2+ACNaHe07h6-tw@mail.gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <CAL_JsqJJPdrYArNhbRPTM=scDghLAWe5=0a2+ACNaHe07h6-tw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/1/26 3:05 PM, Rob Herring wrote:
> On Tue, Sep 1, 2026 at 12:21 PM Alex Elder <elder@riscstar.com> wrote:
>>
>> A recent change caused the embedded PCIe endpoints on TC9564 SoCs to
>> be treated by the devicetree code as PCI buses, which is incorrect.
>>
>> An RB3gen2 system has an "interposer board" that contains a TC9564
>> SoC.  The TC9564 includes a PCIe switch with one upstream port and
>> two downstream (external) ports, plus a third downstream port.  The
>> third port has an embedded PCIe endpoint with two functions, each
>> providing access to a 10 Gbps capable Ethernet interface.
>>
>> The devicetree nodes representing these functions were previously
>> named "pci@" but were renamed in the interest of consistency in
>> commit e806c63ba51a7 ("arm64: dts: qcom: Rename pci@ nodes to pcie@").
>>
>> Unfortunately, of_node_is_pcie() causes nodes named "pcie@" to be
>> treated as PCI bridges, which PCI endpoints are not.  The previous
>> name "pci" matched such nodes as "default-flags" bus type, defined
>> in the of_busses[] array.
>>
>> Rename the PCIe endpoint nodes "pci@" so they are not mistaken for
>> bridge nodes by the devicetree parsing code.  This restores the
>> previous behavior, and allows them to be used for PCI endpoint bus.
>>
>> Fixes: e806c63ba51a7 ("arm64: dts: qcom: Rename pci@ nodes to pcie@")
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> index a13315bf0fb07..99a985a177a61 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> @@ -954,7 +954,7 @@ pcie@3,0 {
>>                          ranges;
>>                          bus-range = <0x5 0xff>;
>>
>> -                       pcie@0,0 {
>> +                       pci@0,0 {
> 
> The kernel should treat either name the same. There may have been some
> reason 'pci' was not included in checks. It could have been that only
> old things are (parallel, plain) 'pci' and anything new is 'pcie'.

OK.  Does this mean "pci@" and "pcie@" should only represent bridge
devices?  (These devices are all endpoints and erroneously had
device_type = "pci" properties, among other things, so I'm already
fixing that.)

Do you want me to make a (separate) change to treat "pci" the
same as "pcie"?

> These are ethernet devices, right? Then the right name is
> 'ethernet@0,0'. If not, then pick something that matches what the node
> is. Both pci and pcie mean the node implements a PCI bus.

They implement Ethernet devices, yes.  But they are used for
pci-ep-bus (and the Ethernet devices bind to a sub-node), and
that's what's important about these nodes.  What's the right
name?  The dynamically-generated node uses "dev@".

Is "ethernet@" still right, if it's also used to access a
clock and a reset and ... via pci-ep-bus?

I want to use the right name, I'm just unsure about what that
is, given its use for access via pci-ep-bus.

Thanks.

					-Alex



> Rob

