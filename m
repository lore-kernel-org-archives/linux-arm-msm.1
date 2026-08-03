Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9FD303C9C
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 14:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785768744; cv=none; b=CNgyr9+zM6Sy7IzUEqkqzbvXoZ5HCz6txx/fcMagRygImbTAZLGyd9aF0LVaJF+OP66d9varuJCr1Gw43wSYeZ/82J5lqDAjIFGjbfsjbu44UVNJlW2IldDssN0QlCyqvG+7UkGFH6ZPPGBWV3A6wPAuS75D74fIO09Wem1D8yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785768744; c=relaxed/simple;
	bh=eZU7vVmJacYWV5q3gZ1UCB2GHirPmhpD1iJGOqdGG7o=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=HGphR7XVWl0kgwSfRFIK0G6OnAKqM7lvtT3s7D/ex7iweJTTTjl/3MWsZI5hUultOhSs1qza5PsUR8etO3tYV974u2goO4rumlfUem6vLc/BDeWwyxx97XjmN11zJulqPFn4B/XRDJ61eT1mwr3KxgTWS3QSkW8xJnkEHKN74xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mS+EszkN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gB7NxhAs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mS+EszkN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gB7NxhAs"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673EBnjg826844
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 14:52:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UVt3vhmqrEq1zY4CTLJsC83gPkVS+OacXt6jIx9fB2E=; b=mS+EszkNilBtQ6yS
	V8VUWOi7Jn/u1OPzWAIcpzJSvGU/whOFTojku09b+miXnwBNZSBLDEe2IzeDRHW3
	tY1TA9RCNig2kHE7VYJow8MTSJCp+wETFjSRezxGZ6xEqwGoSO1Rlva2bozdUOrR
	XvomvTzfVk2uRyVyKUEBBbafcSbg7Y0UF6Qk0a34xadRtZZKmwrh/M4BDCnw7KW0
	I9MPvb/lNyIf0U04C4iQKHMsQXdjC74oPeDbHPeEl9SIx37oEHstr6fnZOESIaoo
	d6O6OPTPxJOgiUeDGDzKKETW4UNHKsrH/BJlHezOrXX1JVBr0YEbVSnv8yj3/PJV
	/K+5ww==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnhkj5aq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 14:52:19 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cab3e9cd922so2338473a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 07:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785768738; x=1786373538; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UVt3vhmqrEq1zY4CTLJsC83gPkVS+OacXt6jIx9fB2E=;
        b=gB7NxhAsNKIy5sFOBVM/zPM+R4OTLnvpaRgnOQzpCQNbQ4gO17TGimr27rL4YIY/kh
         ETyNrHb7K3btcvNeBFZP0e54GKXtsVdZ7OIZIDzv2U3QK08PQ2bYXoESL9LqpgPC3oIV
         FabPjiGck0fqjkUDBhpiD1J8i1l2yhp+O1c8wtbbmgpnXzBPHFCB7y/IFYjLqbvKvjex
         VCfghV3J2TDi2WJ9BFs6SJfmhPBtav/73YR0r0eu5FNeJ8vP7TJl1Q3XtHF2GZVPOL/2
         Ew0w9regg2PjYy+/4AgTXwBLej3oPNlYpSZxEov+Nzor57OpbzGMA+z0r/jnM4gDQJ+G
         rMrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785768738; x=1786373538;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UVt3vhmqrEq1zY4CTLJsC83gPkVS+OacXt6jIx9fB2E=;
        b=jMFzxkrINMxi29P0pFknkjIhZs3lbfJUk9c5VoNYWKgP8BbrC2U3jOZA1h9f5679j+
         8lauUkDP8QXkxUh2Fx6f25eXx13CbjY4QtsRHlUAvG9SxHhpPS0hPcIFM5pvoRSJaaWH
         VycMmAYZgDq4YfMO2WiD3vMx877q1pFGkgDlbaRYSF7UVtegqDuFdCG8rcZtJs3hxozl
         EKL5uYjDifVnN9ibmaFomlN23rAhyV5SnM0PXQnSR0R1q4eKPi4TpcDGD3JutK7vw3ZL
         zjNt95ewC8eK5XTp1RRSCnl6elUKbZ+u93cSS7DEd3un56ESH0q+tK2kjhA+IkEWROko
         Y2lA==
X-Forwarded-Encrypted: i=1; AHgh+Rr0K8iVQ8cQT/Vl0oKhwTFnUgGIeKVLfeo73uAI8+g2Gznx4CIE3e7k/FXPTJkoUUz3sG3iSHw8sgwPhjJJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxaCBrONc/B8D21H+V59j6TF/ypN1dY2ruR98sxD5YfveHdzKrK
	ySG+l/wvwVQPGcaMUjJHVMkeMnwfCTwdLkV7reHP2RntOnJ6TeI7QLRnQoBWHp/cI2z1fbBQ3kK
	GjLuBRllkm77ZxOYK3wIFoLIRG9FMK5CH+a8yonE80Ow/v+7c1ZJBh/RoBbapjrSrupGV
X-Gm-Gg: AR+sD13qZZC6HuzPDNWjQMtUJXcxbETv+P+e+WqmHSRwD3ngL9Zi1WK7LWC7GZ1a2sx
	MV/cOCmguGuzuCrLGE3G+Up817xzRxwtUIJrqL7ihFjbUZCMhzw5Yo6kZkNKqQTJCwwtZfL14ue
	LbuzVnB59nghd2rs1A9pt959do3GGOHqxkqwl+YtJ9LhcQ+dGPP92DfnIBpwkbZoAzPsvJQI3hS
	khUcdiPi301y8ozGp7yuCPdGK/keCTArUsbOf4XxQFUaaDiULlvcRK5H4nK7fAhkYoChn+z03nJ
	6e/RLATwkfhlttMFmda8DZFx5jm5LT64TXgPq9sN2rUfbuBR+SsBYZnFcYqdvXTukrSFg7UXAjF
	0dA/rFXX7Tae4iylyfpM7ILE1gMw=
X-Received: by 2002:a05:6a21:e598:b0:3c0:9c1a:894d with SMTP id adf61e73a8af0-3c92a95303emr10088643637.69.1785768738344;
        Mon, 03 Aug 2026 07:52:18 -0700 (PDT)
X-Received: by 2002:a05:6a21:e598:b0:3c0:9c1a:894d with SMTP id adf61e73a8af0-3c92a95303emr10088602637.69.1785768737659;
        Mon, 03 Aug 2026 07:52:17 -0700 (PDT)
Received: from [192.168.1.6] ([182.77.67.166])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4f197sm40356021eec.6.2026.08.03.07.52.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 07:52:17 -0700 (PDT)
Message-ID: <4cc5c18f-0d33-4729-9094-e520e3142c2c@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 20:22:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] Add TEE based client driver for UEFI Secure
 Application
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
        Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260722-qcom_uefisecapp_migrate_qcomtee-v2-0-b8a8fcbe4211@oss.qualcomm.com>
 <nfijwr2ptpxqvdw625yedep7tmakwvkeavyeobrmig5hbkw77w@rcqyp7h4y327>
 <db27820a-2b43-45e4-bc4a-0e9e81aacd93@oss.qualcomm.com>
Content-Language: en-US
Organization: Qualcomm
In-Reply-To: <db27820a-2b43-45e4-bc4a-0e9e81aacd93@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JQdjxezwCgD32165NZF5-0CtMT8Fm8Nc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDEzMyBTYWx0ZWRfX6XfqNerZ3VGC
 94u8nQNpWCgziTW/ylTKe5MJS6scFtX2+jCl5TXwJkFn4NxbMpKc6xDa8sQh2g/6LHSUoei2/YW
 CFzLL8HpOiXpnCCED+BMRpysqiz9bm/b37M+vgj5h1+BOj9WI+Fe5X9jNwEgmBfInw6OOIv4hVV
 C1yXvT5IzWQri8x0UtshLTvhnx7bpCjeJ82QeptQ52Ev/LFIUMK1ssRQ/N3G3fYD0H6ygoSJoq4
 1Wpik14EWhT4VnhkWqRD01mXkGEfxL250F3V4JzgSDJw24Bl/FzlcweQavpGoE8k0se/DpILof1
 +FyFq1Nhe1JnL3LIo3L5iN1WalY8FyAlFCT17a5QzWv275D9Mi6DPw4mc0GxsOBIUejO/MBbZJs
 DbuPnXVCpqafN/vYdQ9fBvc51X2RkNifIR5KXIldmFDbDdzwcD9DKK5iUoV8FiHF1NzRfuU0AhV
 5D/xzaTYYrzCA0Giwrw==
X-Proofpoint-ORIG-GUID: JQdjxezwCgD32165NZF5-0CtMT8Fm8Nc
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDEzMyBTYWx0ZWRfX3QlZKSIrA/1W
 L9Q5m9/Q9augyE+w+asOuh0R8mUmJ6NX+Sh1FsHAyy03XuqvYgeiWRyNVUj4jUBLEtAXrN7FKxt
 t1K3ry2XPTic/nKUACyd12l5ZyUCHuE=
X-Authority-Analysis: v=2.4 cv=UIjt2ify c=1 sm=1 tr=0 ts=6a70ab23 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=mrmDAJacfjHp5PIfN2e9YA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=P-IC7800AAAA:8 a=NEAV23lmAAAA:8 a=EPKcpx9xAAAA:20 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=mXq_QK0-N2mSdiKvdKIA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=d3PnA9EDa4IxuAV0gXij:22 a=ZT_8zCgGubuJgGonBfBE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_03,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030133

Hi Dmitry,

A gentle reminder, do let me know you opinion on my comments here.
I plan to spin a v3 once we're aligned on any open points.

Thanks,
Harshal

On 24-07-2026 02:43 pm, Harshal Dev wrote:
> Hi Dmitry,
> 
> On 22-07-2026 01:56 pm, Dmitry Baryshkov wrote:
>> On Wed, Jul 22, 2026 at 12:29:11PM +0530, Harshal Dev wrote:
>>> On Qualcomm SoC based platforms, UEFI stores EFI variables within the
>>> Replay Protected Memory Block (RPMB) which is only accessible by the
>>> Qualcomm Trusted Execution Environment (QTEE).
>>
>> Is it so? I think RPMB is accessible to Linux...
> 
> I should have been more descriptive here, RPMB is accessible by Linux but
> its frames can only be prepared by QTEE.
> 
> The RPMB key which is one-time programmed into the storage controller to allow
> authentication of the RPMB frames is generated by and only available to a TEE.
> So on Qualcomm platforms (and many others platforms with a TEE) Linux can only
> route the RPMB frames generated by QTEE to the storage, it cannot create and
> write the RPMB frames itself (it doesn't have access to the key).
> 
> While it is possible for Linux to generate/program/store this key, on Qualcomm
> platforms we do not want Linux to do so because we do not trust it. We trust
> QTEE.
> 
> I will re-phrase this and make it a bit more clear everywhere.
> 
>>
>>> For Qualcomm platforms without emulated RPMB support, specifically
>>
>> What is emulated RPMB support? Why is it mentioned here? Which platforms
>> use emulated RPMB?
> 
> Emulated RPMB refers to RPMB on a storage which doesn't have its own firmware.
> Primarily, NAND/NOR storage. Unlike UFS/eMMC storage, NAND/NOR storage does not
> have a storage controller where we can program the RPMB key to be used by the
> firmware. So we must 'emulate' RPMB by moving the storage driver within QTEE
> and making the driver hold/use the key.
> 
> Qualcomm compute SoCs (Glymur, Hamoa) have RPMB available on SPI-*NOR* storage,
> and a driver for communicating with it is also available in QTEE. And so, these
> have 'emulated' RPMB.
> 
> I will add this detail in an updated cover letter.
>>
>>> platforms where RPMB is not located within SPI-NOR storage and instead
>>> located on UFS/EMMC storage, non-volatile EFI variables can only be set via
>>> a callback request from the UEFI Secure Application to the RPMB service
>>> running in user-space (within the QTEE supplicant [1]).
>>
>> Can it be moved to the kernel?
> 
> We have a plan to move the RPMB service to the kernel similar to OPTEE:
> https://elixir.bootlin.com/linux/v7.2-rc3/source/drivers/tee/optee/rpc.c#L449
> 
> It is a work in progress. Once this happens, we don't need QTEE supplicant available
> on the Linux distribution.
> 
>>
>>>
>>> Unlike the QCOM-TEE driver, the QSEECOM driver (used by the current
>>> QSEECOM based uefisecapp) does not support callback requests.
>>
>> How did it work then? I think Windows has been perfectly using QSEECOM
>> rather than QTEE.
> 
> It works because Windows on Arm on Qualcomm has SPI-NOR storage. A driver for which
> is available within QTEE, and so QTEE does not need to make a callback request
> to Linux to request RPMB frame routing. However, in case of UFS/eMMC storage the
> driver only exists in the Linux kernel and so QTEE must make a callback request.
> 
> And so, if you try to use the QSEECOM driver to write EFI-variables to RPMB
> on a device with UFS/eMMC storage, it won't work.
> 
>>
>>> And on
>>> certain Qualcomm platforms such as the RB3Gen2, attempts to access the
>>> QSEECOM interface fail due to lack of support within Qualcomm TEE.
>>
>> So, I assume, on RB3 Gen2 the QSEECOM doesn't report uefisecapp as
>> supported. Does it?
> 
> It doesn't, this API returns -2 if I add RB3 Gen2 in the allow-list for QSEECOM:
> https://elixir.bootlin.com/linux/v7.2-rc3/source/drivers/firmware/qcom/qcom_qseecom.c#L46
> 
>>
>>> On these platforms, a TEE based uefisecapp client driver is required to:
>>> 1. Access cached & volatile EFI variables stored in uefisecapp's memory.
>>> 2. Ensure persistence of non-volatile EFI variables via writes through
>>> the RPMB service hosted in the QTEE supplicant.
>>>
>>> This series introduces such a uefisecapp TEE client driver for the
>>> aforementioned Qualcomm platforms which installs efi-var operations _if_
>>> the QCOMTEE driver registers support for an object-IPC based uefisecapp
>>> service on the TEE bus during its probe. Only new QTEE firmware versions
>>> available at [2] provide this support.
>>
>> What about existing WoA devices?
> 
> New Windows on Arm devices like Hamoa/Glymur work perfectly fine with existing
> QSEECOM based uefisecapp. But they will also work with this new QCOMTEE based
> uefisecapp once they upgrade their firmware.
> 
> I need to double-check but this firmware release for Glymur on Qualcomm Linux
> is probably carrying the support for QCOMTEE based uefisecapp access:
> https://github.com/qualcomm-linux/meta-qcom/commit/728251fcbe5113980805ea6c571e33235062ee71
> If not, the next release will definitely have it since I have merged support for
> this in QTEE and talked to the boot firmware release team about this.
> 
> The next planned firmware upgrade for Hamoa will also provide this support for
> Qualcomm Linux. And similarly, for all other targets being supported upstream.
> 
>>
>>>
>>> Thus, QCOMTEE now maintains a static list of always-available object-IPC
>>> based secure services exposed by QTEE. These services are implemented either
>>> within the QTEE kernel or within a pre-loaded Trusted Application (TA)
>>> usually loaded by the bootloader. The uefisecapp TA is an example of a
>>> preloaded TA loaded by UEFI. A static list is required since QTEE does not
>>> yet expose any way to dynamically query and enumerate the services exposed by
>>> it.
>>
>> Can it be fixed instead of having static lists? In the end, we can't
>> guarantee that users update the firmware.
>>
> 
> Unfortunately, no existing QTEE release out there currently has this support.
> But support for this is currently being added by QTEE team last I checked with them.
> Once it is available, and a new QTEE firmware release is out there, we will add
> support for dynamically querying QTEE services in the QCOMTEE driver. 
>>>
>>> To facilitate object-IPC interactions from the kernel-space, this
>>> series also introduces a tee_client_object_invoke_func() to allow
>>> invocation of TEE objects similar to the existing tee_client_invoke_func()
>>> API exported by the TEE subsystem which allows invocation of TEE functions.
>>> Some suporting changes are also introduced to track and handle operations
>>> for TEE contexts opened from the kernel-space in the back-end QCOM-TEE
>>> driver.
>>>
>>> Finally and as previously mentioned, access to the object-IPC based uefisecapp
>>> service is restricted on older QTEE firmware versions. A new QTEE firmware
>>> release must be picked up from QArtifactory [2] for all upstream supported
>>> Qualcomm SoCs to enable access to uefisecapp service via the TEE client
>>> driver.
>>
>> What about fused devices?
> 
> The procedure for updating the firmware on fused devices is slightly different.
> The firmware images need to be signed by the OEM using the security profile
> of the chipset before flashing/upgrading them. Security profiles are now public:
> https://github.com/qualcomm/security-profiles
> 
> Regards,
> Harshal
> 
>>
>>>
>>> This patch series has been validated on Kodiak RB3Gen2 platform with UFS
>>> storage by attempting to read/write EFI variables via the efivar tool [3]
>>> after mounting the efivarfs filesystem. See [4] for an example.
>>>
>>> Merge Strategy:
>>>
>>> This patch series could either be taken from the OP-TEE tree or the
>>> QCOM soc tree. I would prefer it to be picked by the OP-TEE tree since
>>> all except the uefisecapp TEE client driver patch in this series make
>>> changes relevant to the TEE subsystem. It would be great if the QCOM soc
>>> tree maintainers can Ack the uefisecapp driver patch.
>>>
>>> [1] https://github.com/qualcomm/minkipc
>>> [2] https://shorturl.at/zQU07
>>> [3] https://github.com/rhboot/efivar
>>> [4] https://docs.qualcomm.com/doc/80-70020-27/topic/manage_uefi_environment_variables_using_efivar_tool.html
>>>
>>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>>> ---
>>> Changes in v2:
>>> - Drop using MSB of the object_id to distingush kernel and user object invoke contexts.
>>> - Introduce enum tee_object_invoke_origin to check the context of object invocation.
>>> - Link to v1: https://lore.kernel.org/r/20260707-qcom_uefisecapp_migrate_qcomtee-v1-0-f659cbd5d04c@oss.qualcomm.com
>>>
>>> ---
>>> Amirreza Zarrabi (2):
>>>       tee: Add kernel client object invoke helper
>>>       tee: qcomtee: Allow object invokes from kernel clients
>>>
>>> Harshal Dev (4):
>>>       tee: qcomtee: Track the object invocation context
>>>       tee: Export uuidv5 generation for TEE backends
>>>       tee: qcomtee: Add support for registering QTEE services on TEE bus
>>>       firmware: qcom: Add support for TEE based EFI-var client driver
>>>
>>>  MAINTAINERS                                 |   7 +
>>>  drivers/firmware/qcom/Kconfig               |  24 ++
>>>  drivers/firmware/qcom/Makefile              |   1 +
>>>  drivers/firmware/qcom/qcom_tee_uefisecapp.c | 525 ++++++++++++++++++++++++++++
>>>  drivers/firmware/qcom/qcom_tee_uefisecapp.h | 120 +++++++
>>
>> I don't see any changes to the QSEECOM drivers. Is it allowed to use
>> QSEECOM and QTEE access to uefisecapp at the same time?
>>
>>>  drivers/tee/qcomtee/call.c                  | 205 ++++++++++-
>>>  drivers/tee/qcomtee/core.c                  |   9 +-
>>>  drivers/tee/qcomtee/qcomtee.h               |  12 +
>>>  drivers/tee/qcomtee/qcomtee_msg.h           |   1 +
>>>  drivers/tee/qcomtee/qcomtee_object.h        |  16 +-
>>>  drivers/tee/tee_core.c                      |  24 +-
>>>  include/linux/tee_core.h                    |  23 +-
>>>  include/linux/tee_drv.h                     |  18 +-
>>>  13 files changed, 952 insertions(+), 33 deletions(-)
>>> ---
>>> base-commit: f3e6330d7fe42b204af05a2dbc68b379e0ad179e
>>> change-id: 20260408-qcom_uefisecapp_migrate_qcomtee-13869d45e014
>>>
>>> Best regards,
>>> -- 
>>> Harshal Dev <harshal.dev@oss.qualcomm.com>
>>>
>>
> 

