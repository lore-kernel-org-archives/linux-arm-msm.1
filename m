Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E9D40860B
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 14:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784903526; cv=none; b=t27EZGZPKw3PzGwu0N9YiWT55RmcdxpD2+wqtURwRxrSCAG/zliRv6wYx/LO6Vo9b+QfaFVEezc5jV7jdmUFjcsldNaCH1M/OKE6kvVDciqQCmvqcPy5q5UAKA7/nwyJRRJUMjwwSK4krh/0IAH9C7y4uiQuNiGvEkR3rZVE6Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784903526; c=relaxed/simple;
	bh=OgcTe/nAVvxoURB67U2AukUlNiyk4tTEkZx5FR3F3Y0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KsTmVf1GL2ANjjG0sQ3hIi/SWtG34CdapIVSNn3nUev5LBAzePdKfFf2gm/KyFeHyyNOKri/PKok/LU1i/rZMsh4muYFtqiviFpSTiivtmUn+Wr21Tp7G0QkhTOIlQmfIqiriI4dmv9/LrKAwRq9s6hPhABIUfezPgWnhmDmX9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NjGEJtaX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AF2y98FP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NjGEJtaX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AF2y98FP"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbC7s2933507
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 14:32:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YpmrrYvfMqZGjA4fFxO5jszeZq/ZiP4Yr5FStrt8TyQ=; b=NjGEJtaX1P5NZzyY
	Ew0gUnACP4yVPH8Wi8+b+dVrrB3f7QqsLMzT0QndyVkRmlGNDdkveqjnQ070EqLL
	VShwehQQHcmW3b+ZjO/zjeeRmFb/ZJCgEa/JLyG9K5eiA6O2+iyCJbZogepRNq2k
	LwPGptt60YO50vC7mTXwY+vWqXJ87PxzbruKESnyTKISc4HvI+DD1TDxH/PhcgRr
	VA9P47mnrqReN3DdEfebvZCuPnwWUzWbBdWge0mgO2+2Zl4v86nR8h+mQ2k1Fvuh
	2g1cIZORmW150f/g91tZIxpiWfttemmNTfbDvYrhVJSFy2J1MT82OdSl/Uq5ntSu
	7oXwkw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8cj8chc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 14:32:03 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c2bcc78abfso352627e0c.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 07:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784903523; x=1785508323; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YpmrrYvfMqZGjA4fFxO5jszeZq/ZiP4Yr5FStrt8TyQ=;
        b=AF2y98FPsx/5rY4f5rp6J4Zek8bvTq7IyRS8rXT5WfDhX5ZDOFCuQI0GcsACyxYKdP
         LJwLQcqXUc9tk2NvRAxbSzzR+RH6FMf2CbktndK9qWb5P9hhzX9/FErWPiEUxwUUBnER
         CGSBL3GI/WnA8vjKiCfEcXs7hWT3IpR0je7eaXAguz1Amt4B2G20mnx7P8/bBqrDQ7FX
         RdgPmsi5GDRHSevtq83eaw1lir0eu6ZFWmTNKfzvbRsaUX/8Nk/m8y8au7Hzco7LQdQl
         q29vIodg+pVbJdzNuoBZygjximuTWJezcbNANgKsOh/oFhawTjzhNAgPCxOOqWNh0YJJ
         1YlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784903523; x=1785508323;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YpmrrYvfMqZGjA4fFxO5jszeZq/ZiP4Yr5FStrt8TyQ=;
        b=RUz89OusXwRqKLK2W51QW2YZMGNol3Dc7YI67CDlOyu7AIjNbekm9QwlqVU5jy6rv4
         blEV9Yjt8Y/c8Gm8jsgXSBzIROfJ/HG7V4dxqoS2L0pX8ovh/7EcYBsZee/Vg2trVqBW
         cW1DcorGhpZi8EYDlr/yi3rhQqFcbDidP+6qU8u/80MMONpnNtY7tdwqrFqL7LN9fmgA
         Ya2EkNiwcNO3YdumlkAoUElDqU4se5/8T/gJLLvqVBF/0xgOw9q+514v0z5YKMCAUa9c
         NBFFa/n1NG4L7/lzpCQaTzioXR3x3PbBaWrBzjmbPvN6lm1s1zv32oMxLsEGXg/pdehU
         EHNQ==
X-Forwarded-Encrypted: i=1; AHgh+RqsP63i2bh3YrtwFGEOOf1q+Wg6GuCYgBEwWR+HA9k030XUpO50wx4SPvtSQ7fnmwIen0ZSen9GgWF/2gA4@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9qezXutxfnt4j/52OWdxlV29pMc31jxi3tqxhZhIGu/6rVx/R
	/i4G8AICcbtUJbiIxFUPoRF9ndLFKDSigM9FbtYdPuxHjsseSr4SXa+G8sHc5y/9ap+zMSBOt3E
	JZr3sLSnKGxZp9XTBtPaGwNL6xU48P61NZSRlTmWwrz35v2IYK0o1QAqvs2w1GAtO6gh+
X-Gm-Gg: AR+sD10GkZhSp1BKYKJF9h1/Rya0UIQhDWFX2LaaO9LsVXH7cPN+gbGLsAliEhr6mB6
	P1WrTJyje4Zpqyu6WjteIYCIeIziXYLMFr0714vHs/ucwP7oFMMLikoSrNQQ2tCVY5xlkmEPP2s
	2KVXKtonbv/yvlpVgcylrK1aGpGhGYuzk7gcqYGEXfV6zYJ+0LbrevZzKPKIgQ6dbjZz3BQGm5q
	twCrpq4+9nInU5AzEXCQOi7iRoC90wEJCFWsQgzYH64T5aLXy4z1f2AgCYePfaz+gIRGAOGB3DW
	pAbEF2zknhAAixPqB0Y4TpNNypkb6ly7/YXH8//6+yCQ3LOsTBuj7acdEPqL094K/xeCwIY835k
	mjXVNPpuVeSNi6jhnj18ik8XZiJg=
X-Received: by 2002:a05:6122:3118:b0:5bd:71cf:e97e with SMTP id 71dfb90a1353d-5c2da0be0dbmr3559001e0c.5.1784903522246;
        Fri, 24 Jul 2026 07:32:02 -0700 (PDT)
X-Received: by 2002:a05:6122:3118:b0:5bd:71cf:e97e with SMTP id 71dfb90a1353d-5c2da0be0dbmr3557783e0c.5.1784903513587;
        Fri, 24 Jul 2026 07:31:53 -0700 (PDT)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f85a2573csm23889185f8f.0.2026.07.24.07.31.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 07:31:52 -0700 (PDT)
Message-ID: <6d1870c1-7fff-4569-8de2-bb45b83cde25@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 15:31:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/8] ASoC: SDCA: enable on DT platforms and add
 Qualcomm WCD9378 (Tambora) codec
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
References: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
 <amHqO5pMFmKRNYTT@opensource.cirrus.com>
 <87452472-0ca6-4ed5-a891-3a688598b5b3@oss.qualcomm.com>
 <amNcM0AxYAe4bU95@opensource.cirrus.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <amNcM0AxYAe4bU95@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GJE41ONK c=1 sm=1 tr=0 ts=6a637763 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=4UEJ9L-Rt-jFuRBfBf4A:9 a=4jHrB3rgKdR5UX8P:21 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzMSBTYWx0ZWRfX03/JsoF35Oyj
 4GP0+gVO4GIkytQYxnjna1cns9uZ7wAeWVjSKNjCKDmDFRW7Eha8cKxYE7KIfe1RNFWU72i/3Fl
 ZX9K3E1c5dlkgHsGONtvzQrLMFVc5egK6f7jaHBKPRWlAltI+xGzzs8duGS1GHmi0PNTzwWs/mv
 k14UWx/anIQ4pHQOwgzhA2xwhIGIOOgjq+0aRAYhwTLzY5b7S3v5WxxiuRAp/wTEG3qnqw0sAMW
 P7EUQeJT4TiZym09YQeWKAixDvUNFAeC+1nAJ2eyVGGDbQqxT8y1FJGiKWB8v6+tRUkdVqZfVmk
 +OC+4KduaezDXNrnWfF/VipmcZ57AEP/jo8E7Kch16LgqlGHbuxRvQJQfT15zuH2cRTFCXI3ZGd
 v2xFAZN5hgdwUb3U9OcytbFmR396SHAayoo6iDEkacz7oYKa80PmfUg9B/D8P+SqhnFGahnmMTF
 tWhH5Yb0l2N01v7gwiA==
X-Proofpoint-ORIG-GUID: CevdaLHBKop5DJp8cB2ddEdBV_Dj3HOv
X-Proofpoint-GUID: CevdaLHBKop5DJp8cB2ddEdBV_Dj3HOv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzMSBTYWx0ZWRfX1+VDBGCM260m
 uXrH0C357dXCSewfYJ9TJv9/FYqsHzcY6lqVQ8k7mdpKybTUF2DXAiFyRiWbX+OT/AbYE3BXFsd
 msHUzSc/JyY17BZIOgn4q7Q/b8fcdLU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240131

On 7/24/26 1:36 PM, Charles Keepax wrote:
> On Thu, Jul 23, 2026 at 02:24:19PM +0100, Srinivas Kandagatla wrote:
>> Thanks Charles, for the feedback.
>> On 7/23/26 11:17 AM, Charles Keepax wrote:
>>> On Thu, Jul 23, 2026 at 12:42:10AM +0100, Srinivas Kandagatla wrote:
>>>> The direction from that discussion was to let DT platforms reuse the
>>>> same class/function auxiliary driver plumbing and have codec drivers
>>>> supply the small amount of static function/entity metadata that DisCo
>>>> would otherwise carry, plus hooks for device-specific bring-up.  This
>>>> series is a first cut at that, with the Qualcomm WCD9378 ("Tambora")
>>>> SDCA codec on the Glymur CRD as the first consumer. Static table that in
>>>> part of this codec is generated from acpi tables.
>>>
>>> Fascinating, a shame I missed the discussion. Main question
>>> I have is what was the reasoning behind using static tables
>>> rather than just putting the data in device tree? All the core
>>> code uses the generic firmware parsing function so should be
>>> perfectly capable of parsing the data out of device tree. The
>>> only bit that is missing is really the sdca_lookup_functions
>>> bit you ifdef out, but updating that to also support DT should
>>> be pretty simple.
>> Two reasons
>>
>> 1. This is laptop platform primarily works on windows with proper acpi
>> tables, These tables are directly derived for ACPI asl tables in
>> windows. Ideally I want to use it the way it is supposed to work.
> 
> This is a little confusing, could we not just the ACPI in those
> cases?

On Qualcomm platforms, ACPI contains many vendor-specific PiP (Platform
Integrated Peripherals) methods that don't follow standard conventions.
This breaks ACPI compatibility on Linux. Consequently, Qualcomm-based
laptops designed for Windows that are run on Linux have to use Device
Trees for hardware description—a temporary solution until the ACPI
implementation becomes standards-compliant.

> 
>> 2. replicating full Disco specs in DT is going to be challenge, Because
>> DT describes hardware but not necessarily at a level of register init
>> tables or to an extent where class drivers need it.
>>
>>> Looking through your presentation (thanks for linking that),
>>> am I to guess this was mostly a device tree people didn't like
>>> the stuff SDCA contains problem? I do see that some of the SDCA
>>> stuff isn't an exact match for how Linux has traditionally liked
>>> to handle DT but also really not sure I see any benefit to DT
>>> and ACPI support being different.
>>
>> I think there is fine line on what can go into DT, some of the hardware
>> init tables are big No No i guess, Power and other ACPI things are not
>> something DT does.
>>
>> I will let DT maintainers comment on this.
> 
> Yeah agree be good to get the DT guys thoughts on this. It seems
> like a misstep to me to insist that the SDCA spec implements a
> completely different system of storing information for DT. SDCA
> is what SDCA is now, and supporting two different parsers seems
> like work no one needs when the one parser we have would work
> fine for both.
Am not sure I understood the two parser concern, what we are
representing in the table is something that sdca core already does after
parsing acpi tables. So we are reusing the same structures. Its like
result of already parsed acpi tables.

I did try
> 
> That said I don't totally object to the idea of an option to
> supply a static block of information as you are in the series. It
> could be useful for transitional and work around situations. But
> it doesn't seem like a good choice for SDCA on DT going forward,
> it is basically going back to the board files that DT was saving
> us from.

Either we have this at driver level or at dt level, both of them have
pros and cons.

If we decide to go with dt, this how the dt entries will look like, this
should give fair bit of idea to DT maintianers for discussion.

soundwire@7630000 {
    wcd9378c_sdw: audio-codec@0,3 {
        compatible = "sdw20217011000";
        reg = <0 3>;
        #sound-dai-cells = <1>;

        /*
         * SDCA / compute-mode slave: this node owns the codec's
         * supplies, mic-bias voltages and reset GPIO -- no
         * separate top-level codec parent.  Existing binding.
         */
        qcom,compute-mode;
        qcom,port-mapping = <2 2 3 4 5 6 7 8>;

        reset-gpios = <&tlmm 191 GPIO_ACTIVE_LOW>;

        vdd-buck-supply     = <&vreg_l15b_1p8>;
        vdd-rxtx-supply     = <&vreg_l15b_1p8>;
        vdd-io-supply       = <&vreg_l18b_1p2>;
        vdd-mic-bias-supply = <&vreg_bob1>;

        qcom,micbias1-microvolt = <1800000>;
        qcom,micbias2-microvolt = <2750000>;
        qcom,micbias3-microvolt = <1800000>;

        /*
         * ================================================
         * NEW: SDCA function topology as a child node of the
         * slave.  A DT walker (see caveat #1 above) picks
         * this up during slave probe and hands the fwnode to
         * find_sdca_entities()/find_sdca_clusters()/etc.
         * ================================================
         */
        sdca-function-simple-jack@3 {
            reg = <3>;
            function-address = <3>;   /* mirrors ACPI _ADR[2:0] */

            /* DisCo v2.1 in use */
            mipi-sdw-sw-interface-revision = <0x00020001>;

            /* Errata 01 Item 1: Reset_Function_Now timeout */
            mipi-sdca-function-reset-max-delay = <100000>;

            /*
             * Entity 0 controls: FunctionSdcaVersion, Type,
             * ManufacturerId, Id, Version, Status, Action,
             * Device{Mfg,Part,Version,SdcaVersion}, ...
             * 14 controls at selectors 1,4,5,6,7,8,9,A,10,
             * 11,2C,2D,2E,2F.
             */
            mipi-sdca-control-list =
                /bits/ 64 <0x0000F000000307F2>;

            mipi-sdca-control-0x5-subproperties {  /* Type */
                mipi-sdca-control-access-mode  = <0x5>; /* DC */
                mipi-sdca-control-access-layer = <0x4>;
                mipi-sdca-control-cn-list      =
                    /bits/ 64 <0x1>;
                mipi-sdca-control-dc-value = <0x08>;
                /* 0x08 = SimpleJack */
            };
            /* ... 13 more Entity-0 control subnodes ... */

            /* -- Entity index & cluster index (Table 9) ---- */

            mipi-sdca-entity-id-list = <
                0x01 0x02 0x03 0x04 0x07 0x08 0x09 0x0A
                0x0B 0x0C 0x0D 0x0E 0x0F 0x10 0x11 0x12
                0x13 0x15 0x16 0x17 0x18 0x19
            >;

            mipi-sdca-cluster-id-list = <0x1 0x2 0x3 0x5>;

            /* -- Init table (Table 9 DsdBuffer) ------------ */
            /*
             * Format: repeating { u32 addr (LE), u8 val }.
             * First 5 of 62 entries shown -- the full table
             * is the QcSimpleJack.asl BUF0 transcribed:
             */
            mipi-sdca-function-initialization-table = [
                F0 04 18 40  00
                /* 0x401804F0 = 0x00  DIGITAL_PLATFORM_CTL */
                6E 04 18 40  10
                /* 0x4018046E = 0x10  DIGITAL_INTR_MODE    */
                4D 00 00 00  01
                /* 0x0000004D = 0x01  SCP_BUSCLOCK_BASE    */
                62 00 00 00  02
                /* 0x00000062 = 0x02  SCP_BUSCLOCK_SCALE   */
                6A 01 18 40  80
                /* 0x4018016A = 0x80  CP_DTOP_CTRL_14      */
                /* ... 57 more entries ... */
            ];

            /* ============ Entity subnodes ================= */

            /* -- 0x01: IT 41 (HPH render input) ------------ */
            mipi-sdca-entity-id-0x1-subproperties {
                mipi-sdca-entity-type   = <0x02>;      /* IT */
                mipi-sdca-entity-label  = "IT 41";
                mipi-sdca-terminal-type = <0x0191>;
                /* 0x0191 = PDM RENDER STREAM */

                mipi-sdca-terminal-clock-connection {
                    /* Label-based reference, not phandle */
                    mipi-sdca-entity-label = "CS 41";
                };

                /* Controls: 4 Usage, 8 Latency,
                 *           0x10 ClusterIdx, 0x11 DP-sel */
                mipi-sdca-control-list =
                    /bits/ 64 <0x30110>;

                mipi-sdca-control-0x4-subproperties {
                    /* Usage: 7-tuple <usage, CBN, sample_rate,
                     * width, full_scale, noise_floor, tag>,
                     * all little-endian u32.  Here:
                     *   HIFI, 48 kHz PCM, 16-bit.
                     */
                    mipi-sdca-control-access-mode  = <0x0>;
                    mipi-sdca-control-access-layer = <0x4>;
                    mipi-sdca-control-cn-list =
                        /bits/ 64 <0x1>;
                    mipi-sdca-control-range = [
                        07 00 01 00                /* 7x1 */
                        02 00 00 00
                        D0 02 00 00
                        80 BB 00 00                /* 48000 */
                        10 00 00 00                /* 16 */
                        00 00 00 00
                        00 00 00 00
                        00 00 00 00
                    ];
                };
                /*
                 * DataPort selector for IT 41 is a 16-col x
                 * 4-row range where row-0 col-6 = 0x06 (DP6)
                 * and everything else = 0xFFFFFFFF.  260 raw
                 * bytes; omitted here.
                 */
            };

            /* -- 0x02: CS 41 (48 kHz clock source) --------- */
            mipi-sdca-entity-id-0x2-subproperties {
                mipi-sdca-entity-type  = <0x0B>;       /* CS */
                mipi-sdca-entity-label = "CS 41";
                mipi-sdca-cs-type      = <0x0>;
                mipi-sdca-control-list =
                    /bits/ 64 <0x10000>;

                mipi-sdca-control-0x10-subproperties {
                    /* SampleRateIndex: idx 1 -> 48000 Hz */
                    mipi-sdca-control-access-mode  = <0x5>;
                    mipi-sdca-control-access-layer = <0x4>;
                    mipi-sdca-control-cn-list =
                        /bits/ 64 <0x1>;
                    mipi-sdca-control-dc-value = <0x1>;
                    mipi-sdca-control-range = [
                        02 00 01 00
                        01 00 00 00  80 BB 00 00
                    ];
                };
            };

            /* -- 0x03: MFPU 21 (multi-source via pin list) - */
            mipi-sdca-entity-id-0x3-subproperties {
                mipi-sdca-entity-type    = <0x22>;   /* MFPU */
                mipi-sdca-entity-label   = "MFPU 21";
                /* Input pins 1 and 2 wired */
                mipi-sdca-input-pin-list =
                    /bits/ 64 <0x6>;
                mipi-sdca-control-list =
                    /bits/ 64 <0x2>;

                mipi-sdca-input-pin-1 {
                    mipi-sdca-entity-label = "IT 41";
                };
                mipi-sdca-input-pin-2 {
                    mipi-sdca-entity-label = "IT 131";
                };

                mipi-sdca-control-0x1-subproperties {
                    /* Bypass = 1 */
                    mipi-sdca-control-access-mode  = <0x5>;
                    mipi-sdca-control-access-layer = <0x4>;
                    mipi-sdca-control-cn-list =
                        /bits/ 64 <0x1>;
                    mipi-sdca-control-dc-value = <0x1>;
                };
            };

            /* -- 0x07: SU 43 (selector, driven by GE 35) --- */
            mipi-sdca-entity-id-0x7-subproperties {
                mipi-sdca-entity-type    = <0x06>;     /* SU */
                mipi-sdca-entity-label   = "SU 43";
                mipi-sdca-input-pin-list =
                    /bits/ 64 <0x2>;
                mipi-sdca-control-list =
                    /bits/ 64 <0x2>;

                mipi-sdca-input-pin-1 {
                    mipi-sdca-entity-label = "XU 42";
                };

                mipi-sdca-control-0x1-subproperties {
                    mipi-sdca-control-access-mode  = <0x3>;
                    /* RO, DEVICE layer -- GE writes it */
                    mipi-sdca-control-access-layer = <0x10>;
                    mipi-sdca-control-cn-list =
                        /bits/ 64 <0x1>;
                    mipi-sdca-control-range = [
                        01 00 02 00
                        00 00 00 00  01 00 00 00
                    ];
                };
            };

            /* -- 0x09: PDE 47 (HPH power domain) ----------- */
            mipi-sdca-entity-id-0x9-subproperties {
                mipi-sdca-entity-type  = <0x11>;      /* PDE */
                mipi-sdca-entity-label = "PDE 47";

                /* Managed IT/OT entity IDs */
                mipi-sdca-powerdomain-managed-list = <0xA 0xB>;

                /* Delay triplets: <from_ps, to_ps, us> */
                mipi-sdca-powerdomain-transition-typical-delay =
                    <3 0 30000>, <0 3 30000>;
                mipi-sdca-powerdomain-transition-max-delay =
                    <3 0 30000>, <0 3 30000>;

                /*
                 * Bits 1 (REQ_PS), 16 (ACTUAL_PS) plus bits
                 * 48..53 for six pseudo-controls (0x30..0x35)
                 * that only exist to anchor HPH OCP/CNP/SURGE
                 * interrupt virqs.  WCD9378 quirk with no ASL
                 * analogue; a real binding would model these
                 * via a separate interrupt property, not by
                 * inventing control selectors.
                 */
                mipi-sdca-control-list =
                    /bits/ 64 <0x003F000000010002>;

                mipi-sdca-control-0x1-subproperties {
                    /* Requested_PS -- range PS0 or PS3 */
                    mipi-sdca-control-access-mode  = <0x0>;
                    mipi-sdca-control-access-layer = <0x4>;
                    mipi-sdca-control-cn-list =
                        /bits/ 64 <0x1>;
                    mipi-sdca-control-range = [
                        01 00 02 00
                        00 00 00 00  03 00 00 00
                    ];
                };
                /* Actual_PS (0x10 RO) + six 0x30..0x35 IRQ
                 * anchor subnodes omitted */
            };

            /* -- 0x0A: OT 43 (Headphone jack, no controls) - */
            mipi-sdca-entity-id-0xA-subproperties {
                mipi-sdca-entity-type    = <0x03>;     /* OT */
                mipi-sdca-entity-label   = "OT 43";
                mipi-sdca-terminal-type  = <0x06C0>;
                /* 0x06C0 = HEADPHONE JACK */
                mipi-sdca-input-pin-list =
                    /bits/ 64 <0x2>;
                mipi-sdca-control-list = /bits/ 64 <0x0>;

                mipi-sdca-input-pin-1 {
                    mipi-sdca-entity-label = "IT 41";
                };
            };

            /* -- 0x0C: GE 35 (jack detection group) -------- */
            mipi-sdca-entity-id-0xC-subproperties {
                mipi-sdca-entity-type  = <0x12>;       /* GE */
                mipi-sdca-entity-label = "GE 35";
                mipi-sdca-control-list = /bits/ 64 <0x6>;

                /*
                 * Table 18 packed blob:
                 *   u8 mode_count
                 *   per mode: u8 val, u8 ctrl_count
                 *     per ctrl: u8 ent_id, u8 sel, u8 cn,
                 *               u32 val (LE)
                 *
                 * The mode 0/1 entries route "unplugged" and
                 * "unknown" to the same SU45 selector as
                 * mode 4 (headphone) -- WCD9378 firmware
                 * workaround, not a spec behaviour.
                 */
                mipi-sdca-ge-selectedmode-controls-affected = [
                    04                            /* 4 modes */
                    00 01  08 01 00  01 00 00 00 /* 0 -> SU45 */
                    01 01  08 01 00  01 00 00 00 /* 1 -> SU45 */
                    03 01  07 01 00  01 00 00 00 /* 3 -> SU43 */
                    04 01  08 01 00  01 00 00 00 /* 4 -> SU45 */
                ];

                mipi-sdca-control-0x1-subproperties {
                    /* SelectedMode: mode -> terminal-type
                     * range, 2 cols x 4 rows */
                    mipi-sdca-control-access-mode  = <0x0>;
                    mipi-sdca-control-access-layer = <0x4>;
                    mipi-sdca-control-cn-list =
                        /bits/ 64 <0x1>;
                    mipi-sdca-control-range = [
                        02 00 04 00
                        00 00 00 00  C0 06 00 00   /* unplug */
                        01 00 00 00  C0 06 00 00   /* unknwn */
                        03 00 00 00  D0 06 00 00   /* h-set  */
                        04 00 00 00  C0 06 00 00   /* h-phon */
                    ];
                };
                mipi-sdca-control-0x2-subproperties {
                    /* DetectedMode -- RO, drives SDCA_4 IRQ */
                    mipi-sdca-control-access-mode  = <0x3>;
                    mipi-sdca-control-access-layer = <0x4>;
                    mipi-sdca-control-cn-list =
                        /bits/ 64 <0x1>;
                    mipi-sdca-control-interrupt-position = <4>;
                };
            };

            /* -- 0x11: FU 33 (mic feature unit, no ctrls) -- */
            mipi-sdca-entity-id-0x11-subproperties {
                mipi-sdca-entity-type    = <0x07>;     /* FU */
                mipi-sdca-entity-label   = "FU 33";
                mipi-sdca-input-pin-list =
                    /bits/ 64 <0x2>;
                mipi-sdca-control-list = /bits/ 64 <0x0>;

                mipi-sdca-input-pin-1 {
                    mipi-sdca-entity-label = "IT 33";
                };
            };

            /*
             * Remaining entities elided -- IT 131, IT 33,
             * PDE 34, XU 42, SU 45, OT 45, CS {131,36,236},
             * SU 35, XU 36, OT 36, MFPU 236, OT 236 -- all
             * follow one of the shapes shown above.
             */

            /* -- Cluster 0x1: stereo HPH render ------------ */
            mipi-sdca-cluster-id-0x1-subproperties {
                mipi-sdca-channel-count = <2>;

                mipi-sdca-channel-1-subproperties {
                    mipi-sdca-cluster-channel-id      = <0x1>;
                    mipi-sdca-cluster-channel-purpose = <0x1>;
                    mipi-sdca-cluster-channel-relationship =
                        <0x2>; /* Left */
                };
                mipi-sdca-channel-2-subproperties {
                    mipi-sdca-cluster-channel-id      = <0x2>;
                    mipi-sdca-cluster-channel-purpose = <0x1>;
                    mipi-sdca-cluster-channel-relationship =
                        <0x3>; /* Right */
                };
            };

            /*
             * Clusters 0x2 (mic mono), 0x3 (opt RX, 3ch) and
             * 0x5 (opt TX mono) elided -- same shape.
             */
        };
    };
};

> 
> Thanks,
> Charles

