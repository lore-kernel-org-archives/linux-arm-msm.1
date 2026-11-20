Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795193134;
	b=JMTkxCfeElIXjBc+XztWBqWQCb3QKBoqjhoIWaXehYY87NGHZxQV3WmQVETZbCvAH00Q
	 LUIysA4Qgiwpe3i3I0aG0sR/GJoeJ5fUkRQNb8eKhMAKiHnaHZgSd7jVA2d/038/sYpFX
	 gax9sCL8TPcfNmf+914OQiD9QAEeODNa1560GezLlcqP+TiKpTONZEyud5CllHtH89dtC
	 u2FIgZpH3nHMY/2saBQqKvbzDrRYOKOr3xxR+uxVvDpR00mbjzPqGr1P0FuoUWTOiCQiw
	 iTVBdXw5sOPNuQ//Cg265MtNJ5I7VCsEIaLil0hZxNpbrFej9UjBxTxfyduGOAeVlqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795193134;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4IlXOQ7f0zn8jf6zZzbIrtKtz6kWu6T2Z8xnSRwhbZw=;
	b=I2DSvXCq8HrM4MWaoRytkAT910K4Z4JqUytfFVlSij99QqHMRRGg45diM7UiWAnarqUL
	 K2qrCoKN99NEbIa9eWSKU+hb/Ib1ZcnbgQNuKaLuSXeqHjgI128ZEJ2oVP910GqwoL1TP
	 UcZjgzcntSJCxThenM3ONJ9lzW+a+4Cq3FlkQyr9MJlYWVIARfIZ1NdfrQWWr51KoV9eC
	 2nY44RrGLjonds9US8FbQ3YADm7K0lR4QWRxrDzzvhg5AL8q3CEfAxeOFaJDpsPPdwkjH
	 aO/2ZINt/M14gsbplYBLSEHIOZy3Q6/mQBFCEt44Xz40Hi1tyDyEOHinbhYWpZQCWdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y4SgVwVh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iEr7E6hu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DD5606A336
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 16:45:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52DD5606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y4SgVwVh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iEr7E6hu
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKGFsqJ3830173
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 16:45:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4IlXOQ7f0zn8jf6zZzbIrtKtz6kWu6T2Z8xnSRwhbZw=; b=Y4SgVwVhvElqL7gM
	AuSh76nTy6d07wAWzQzAByaL8WNeDbQOQT5zJS5pta+Ws1fYjmdZjPnBJxgiL4w0
	GhPfMtuR8uCYU/RRAt94Iob+xSvCO+qTg3rNqUAL+y8lLKHkpF3MZ7Saxn0IGnDI
	EKntjdJy5BWBvejh1PTSi4ssjKiXLm7z7sefqI1ak3dVrUaoTJroQs01a1DbJUB/
	Uef+g1a7fB7tv05HUU8m+jo3yxnV+BoJn9y3WB2JUKJXwrlmoLjkQwIMp6sq0Gk8
	1A3AKDO99MtLsIIVOXYBTaaOg89Us31EPpaSR+N+hosLbOmXyZHoKOcWRHNg9rJ6
	pZi97A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2sjwg3vk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 16:45:33 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-38355b03cb8so1032835eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 08:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795193132; x=1795797932; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4IlXOQ7f0zn8jf6zZzbIrtKtz6kWu6T2Z8xnSRwhbZw=;
        b=iEr7E6hurkE6sq89FOOL7ozBM6i3HW1b3bO7IyX2RPbOtt+2w44DjRoGTJbYH8J+9R
         fgH2omQKCTmxmbIV+ZseWcu6DK4CVzfRJcDNouH2erW3PfwawF+QKMvtAla2kHbBNzyA
         cBSSYybNXkB1/aRzi3jqxDxVAvMnxE4pYfqUxrbgAYq/MBLl/bnMPhO6lh1/goWwr89l
         Ch3QFeClyEj3XedhsG4yZzCmCnjLcpziHtQcOPGzn1vjn96pVOeyWwlr0d7yHpcNLQOv
         qu+skBXeHh7JiXv+LuTt+wpQoaNq1w2UsOcj1ZiFptLFo2ZYWfJ02uIUOUg4Q0Bx4aqg
         qZWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795193132; x=1795797932;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4IlXOQ7f0zn8jf6zZzbIrtKtz6kWu6T2Z8xnSRwhbZw=;
        b=CFDABSs0hK4YgknvD3UTsRkcz2M9yaCphGlZ+lkRC+6c29Uce8Td5S8gWJF6Al2MAP
         zdWnTDDQkbMKgJI9yPGsJ9tlVDbUl/x+L/B+MvlTTR52gF3PbuEIQ/dxkuhS4JXFcZ13
         fiPRLDGwKVy8NOVwqj8jzKT3F8yjnLU1vGyQpWSsRqhjt51X+g4yhJu+eR5IZWe6vt7o
         BMZAScwUx8vxlUgPEvd0VJ5aHNKX8r+/wrNLiQCH3pVv7hSD8J2pvOKIsV5d9RNXHE+S
         VmJRRdLrbeWd5Iqno7dj/el+u7DIp6fBvslZB+6T1VPcGw2swlkmTgve+SCFhowD9mi+
         +34A==
X-Forwarded-Encrypted: i=1; AL+hErEttLuATGoIyWKajoOvGWB5swEvsTU0S8Qgwz0ZnPnc4Pt36Zh8/5icC4iHu74GA+D/441mpeyH+72AqI0+@vger.kernel.org
X-Gm-Message-State: APuU4Z8EoTfEnDESodugFoyFsLJuiKgijFH7TFn8ktYKwVszTf7UlqMG
	+Up3v7JipX2SokaVTDTP0/RjdEJpQtlypot+QUifiay65X9cz6dG+VOAaYbQpq9CrtTaXCfZUOz
	IphopP4/mhHepGLtFUMz16vMVQK9iSwx+hV93nDW7/gpPlGhqyVsstdx7/UF7HmKo7+iB
X-Gm-Gg: AZFdTZd7dtLwJeaMGEBev0B925sF9+bSg04rmglnoHtfZctGZ96dVNvXDwyjovNUMZb
	2PPC0Sf444XBiL/Am1/PLdFTAuy+kjF0J6889shXtC0Hd1YJIMZzC5+MAKByUPyQkfSVELRrpN2
	W32BCECDP1yJMSyFPi2uC6oI3xwLLdC11tlDWCLzj6wDhoTPx8fUd9wYLQNyNLnJT2wR8ut92ek
	qPSg8TB4ATI4TjThe5bEIeJbyskL1PtF12b/jrkqhdrx2y4Bil80RIf3DVFwBkF8InQD9QttVnu
	eLdwnE9N5pSQYrXX2sp9kh7OSkPiIy8uV6t28pNB5zMwitGIcXWTWhun4UohSs5WPkwu9YghM1y
	L+SN0bEPl5mf6FiwKpt0OshzynSXZr3UqBx/ysHCdAzOmadsRLeF45Fh3nrg9fsreggEEh7Vfq0
	Tmz0vBd4S50jcs3oGPL9zJ5po=
X-Received: by 2002:a05:7301:2419:b0:367:185e:867a with SMTP id 5a478bee46e88-38571027a5dmr3430891eec.38.1795193131895;
        Fri, 20 Nov 2026 08:45:31 -0800 (PST)
X-Received: by 2002:a05:7301:2419:b0:367:185e:867a with SMTP id 5a478bee46e88-38571027a5dmr3430845eec.38.1795193131141;
        Fri, 20 Nov 2026 08:45:31 -0800 (PST)
Received: from [10.226.59.182] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385667decc2sm9309301eec.9.2026.11.20.08.45.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 08:45:30 -0800 (PST)
Message-ID: <ca6de262-80e3-4c38-8f3c-122712d3f54d@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 09:45:30 -0700
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
Subject: Re: [PATCH] bus: mhi: host: Only expose controller sysfs attributes
 on the controller device
To: Slark Xiao <slark_xiao@163.com>
Cc: mani@kernel.org, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261111115659.11943-1-slark_xiao@163.com>
 <826c1746-137b-4a5a-968e-8e0449a25e78@oss.qualcomm.com>
 <3cb75687.54e4.1a1ed794488.Coremail.slark_xiao@163.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <3cb75687.54e4.1a1ed794488.Coremail.slark_xiao@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -ybvmI_g4Q5NoJ0pb-NEBvOz8qw8F4Gu
X-Proofpoint-GUID: -ybvmI_g4Q5NoJ0pb-NEBvOz8qw8F4Gu
X-Authority-Analysis: v=2.4 cv=dZ4VTnXe c=1 sm=1 tr=0 ts=6b00792d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=_J-3HC_dJu7vbrgoKJ8A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA2NiBTYWx0ZWRfXxbT76lNNXeqo
 31Fdm+809tl7klqJhziY3E9qUQ/fXCG7eFXYWD3klwfTXJ8e6W6nZ2YAkSZOFJfxXNVxuUGD9zz
 b85o1wNnLF1tPRWbqHxDLgsCK7sGrFA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA2NiBTYWx0ZWRfX7BAIv9+adY5L
 5qkw7UlTwiQcqCPexYUoE4cios19u1yglFJWipmFXZYDEZbYN1Xq78Wp3Ygac0R54LntTvpXsU0
 T5WiviRyC2hKW6/hJT81xP0fP9vZMFxB8pw26441nGgQgV1GZ+YtamtacJmlWmO95y2Y+PX12Vf
 Zn5uhuQOyRfMGSvnCWT/CX8sNkYbAyAO8ahdLWTV1loEFuZRnR+hRjRnKNRii3tjgYSQR2zHau3
 OgkjTX0TB+b+AE4fmA2eBnoikzdn1qpsLrMZUdbczX8OG5jCL8Wepy1Cfn2lYVgW9eqBSoJCaZR
 xqnNweKQGsX5SSPK67b39AMJAhuRsCMAfnZxOGZoi1iGruue92UwP1ADXTCPM2wfj6x70cddLIH
 sywc1RW4uVHpRB+xii4BDKr9loDQlSCgxzZ/Uk1LyagPQKFznbv3MxQoWQA20kClxcYITDiyMIy
 Zn9Jmox+dJOBjxFHWEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200066

On 11/18/2026 12:05 AM, Slark Xiao wrote:
> 
> At 2026-11-14 02:42:46, "Jeff Hugo" <jeff.hugo@oss.qualcomm.com> wrote:
>> On 11/11/2026 4:56 AM, Slark Xiao wrote:
>>> The serial_number, oem_pk_hash and soc_reset attributes are registered
>>> through mhi_bus_type.dev_groups, so the driver core creates them for
>>> every device on the MHI bus.  MHI client devices (the per-channel
>>> devices such as mhi0_DUN or mhi0_MBIM) are also MHI bus devices, so
>>> each of them ends up with its own copies of these files even though
>>> they all operate on the same mhi_controller:
>>>
>>>     $ ls /sys/bus/mhi/devices/mhi0_DUN/
>>>     driver  oem_pk_hash  power  serial_number  soc_reset  subsystem  uevent
>>>
>>> This is wrong for several reasons:
>>>
>>>     - The attributes describe the controller, not the channel.  Their
>>>       callbacks all dereference mhi_dev->mhi_cntrl and read BHI registers
>>>       or issue a controller-wide SoC reset, so writing soc_reset through
>>>       mhi0_DUN resets the whole device while looking like a per-channel
>>>       operation.
>>>     - oem_pk_hash reports failures with dev_err(dev, ...), so a single
>>>       failing controller produces one log line per registered channel
>>>       device instead of one.
>>>     - Userspace has no way to tell which copy is authoritative.
>>>
>>> Move the attributes off the bus and attach them to the controller
>>> device only.  mhi_register_controller() now installs the group via
>>> mhi_dev->dev.groups before device_add(), while the channel devices
>>> created by mhi_create_devices() are left untouched.  No functional
>>> change for the controller device; the files stay at the paths listed
>>> in Documentation/ABI/stable/sysfs-bus-mhi.
>>>
>>> Note that trigger_edl was already handled this way, through an explicit
>>> sysfs_create_file() on the controller kobject, which is why it never
>>> appeared on the channel devices.
>> I agree with the rationale, but this does appear to change uAPI. Are you
>> sure no one is using these on the channel devices?
>>
>> -Jeff
> Hi Jeff,
> For oem_pk_hash and serial_number, all interface returns same value.
> I think there is no need to keep these interfaces under the channel
> devices.
> 
> For soc_reset, it write the register directly and it works for the entire
> device rather than a single channel.
> 
> So I think there is no problem to remove them.

These are uAPI. The golden rule of the kernel is that we do not break 
userspace. It does not matter that their existence is a "bug", if there 
is userspace using them, then we must keep them.

I could agree with you assessment that having these items on the channel 
device is a mistake (and I do), but that does not change the rule.

So far you have not provided any data to say that userspace is in fact 
not using these, and therefore removing them would have no impact.

Without that analysis, I am sorry to say I am uncomfortable proceeding 
with this change.  Mani is free to ignore my concerns and apply this 
patch at his own risk.

-Jeff
