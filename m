Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B654D9F9E
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 11:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789644058; cv=none; b=amZiwSanqn61uimAt64em2f3/z1ChNfxJSAkNchiHQ7MzKs8wSdP8mfN0t9Lm4IlnPc6NFliLDcQuJtBr0VgqVpzzn0yLrvNeSH1eBN6YavQ7C+t1j5jSSjj/9UdpERwl4MHMqB6ZowF2OCRU0rUfpd+tSAcZ8Ky656yf+XBh4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789644058; c=relaxed/simple;
	bh=7rKl0AWO6eLBYbsZobkjRaiVkXQyb16j3S1qKoNwsSo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ixt+9yIdVqapMg6CiYZ+kGd9DEJYYiyZ0Ij2rIc3E57B+kk9GGQmUdj/2BCZ8C0JkDIPu38I6wvp29lWJUjaDf9RQcIU8xYDwGT6FyKyDPGpL0ne2cG//20sTXmrqKtADGtNPkPRxUzvdv5KQNT6d3V3LCEhDZ4Pr+bxsydzte4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I/qmANkm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jg9xxxCl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I/qmANkm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jg9xxxCl"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9Zcvn1257860
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 11:20:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HzD5UCfH+DcoHQ9K4jzE7+zmmRizxbw3RJ39vgxRvhU=; b=I/qmANkm3jGmrjPG
	fdjAPOhcwIon5+gOBPpRXKT2op23W3T5bs58DhvAoSQnyoySWHeqbuj+8yfF/QIZ
	E6ZwTu+06ISkttaqMCdmn/fszcVKkeUffCL+RO8A0Ej1jGiKN6j0Qly/8VjE8GNo
	VWP1W6MTgS2ttZ0SVk7KCWmHjIGlgeQPu15+zPoIXjP2Uy4/EpB6wGEgjlpEQn9a
	LvWU6x0R6Jq41zLyszTDGZQ+oWLjX63khcd1twcBMy3p3L89eiAUVZKPUHtTew+0
	YafJkfFHaSvLm81Eed6lqhDAVznxWoL5JfUi0FblBTxubuUvMmrMG3+NVJUa7qiN
	ysbAEA==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grdftgfr4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 11:20:50 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-80621978fddso451624a34.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 04:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789644049; x=1790248849; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HzD5UCfH+DcoHQ9K4jzE7+zmmRizxbw3RJ39vgxRvhU=;
        b=Jg9xxxClJDM6Se/soCHEYUn20WG9OXaI1DyfRK0AWhXjejKBTpAGxf+NJzSjLAf6qL
         EY6QHVdeuXxMXNVODamycnf9C0K+AnW/WU/nFqDl58pGuhmd9ovh5zvm8x0E8sCqoaXF
         xdwIrd01dsuonVbFXOyG0Qaz+QCuJip/GHKDf7BnznD3iyp00fHS4q8ENxCxoKd9AQYw
         GwqEawWi0H3IBNO01HmEIoemmSGPdn5j22bJ51TjOOPRczBTTqLke6tmisElIM5hKBA3
         0HKLpMFLmIfyMIvy/gH/Ve0xUNlLlzq5j7NR7/OYhe3lDxT/VS0oMS9ZNzAskax8Twka
         LVcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789644049; x=1790248849;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HzD5UCfH+DcoHQ9K4jzE7+zmmRizxbw3RJ39vgxRvhU=;
        b=VETK2Y060e2vXFwczjqG8Y0K7Oe2WXgp0v//AXJtBINoPDfFcNLBPqwl2lMEYVRuCN
         mpQphO3mrQI4IPTew5R9hIab3FHov8vsjrC4E0UKwKu+ifrva5JAkki7y8iw9abfbZ5X
         kfhl/nqi1vuCX83BsNEBoK5Zts52GGaBpXl2E70QU3KgexzO5SXHsE/ejUKntvP4E+0Y
         7w7cAbfaptigvuIWF+jQO1FPeNrdZmYVmUwkTHz75BUyHx8v5QqNWFm/LZFiVZSYSrKg
         8610oe9uhsriSr4TEVq4QKggssGCNJZy9ZKbQOCi9bmyamXuxeWk/A+16VDTO8RDBjS2
         KZ/A==
X-Forwarded-Encrypted: i=1; AKwUvBzcGM+nZMhJZzYIoCZljaZO5nHFX6+v7FZd0O2wbVGgk8DqLMJyTubdsNSE9rYckvsj+I4A028l4RlfktDU@vger.kernel.org
X-Gm-Message-State: AFuF++nkgl9MVkcATr4033hibHrIp0yBOp6YseqGbG+aumy/bVMwqqnP
	HSMN/OMAVkknzsy3ajb1EJpPe24e0f8iTjBIsRWuy4HsBL1wr+vtV+4RyuiIVv0c7TlEe8n8NsW
	/t/xF47/3L11QYAlEaeqoDKYzD92g8uxwi15DxkyLDjck62KNFRillLusLYn33TAkjIWc
X-Gm-Gg: AYBFou30lOMs4hvo3Bq8xcppTyU47rF0V2LU0/J+Nm0sNQaaVwZQpqAlfh5ugZEhiq0
	9qX5i77ruXPeNQR+lE4QE3ZhWWpUTjNIk3tbdQ6cPCL8U5SMcOuROQ7+B2BMtn5+RB0Da1mghSW
	iQvns1sdKZ20RxMq5NEhvyTxEVDovschmwQb0GQgSbai0gD2pQ7ta3zG68WZhxrYjlQ00F9pGM3
	7Mndx2hum40SYq3oly0s6o2/EHJTBPKk5lH9hydUUUe6enYrwx41J+Csq0WC68ZT5JO4TnHE69X
	9c6KZXgFBB92Yx8vzv+45wUT6GMIKE55AW3cWyrI2OZTd8ex4uHHbLQGD/ksgFn57/DwAaSLBf1
	ch2F/V3+psXdP8vTcTPuvww+MQlEtmcRLYHU=
X-Received: by 2002:a05:6820:1f14:b0:6b7:8396:f3e2 with SMTP id 006d021491bc7-6c7d4cee1fdmr6045516eaf.68.1789644049478;
        Thu, 17 Sep 2026 04:20:49 -0700 (PDT)
X-Received: by 2002:a05:6820:1f14:b0:6b7:8396:f3e2 with SMTP id 006d021491bc7-6c7d4cee1fdmr6045492eaf.68.1789644048917;
        Thu, 17 Sep 2026 04:20:48 -0700 (PDT)
Received: from [192.168.0.173] ([183.83.137.165])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395bf6e8esm13815959c88.0.2026.09.17.04.20.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 04:20:48 -0700 (PDT)
Message-ID: <4e4acb29-0b3e-4b76-8179-b49745f53bf5@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 16:50:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question about Iris SID override assertion on Yoga Slim 7x
To: Birk Skyum <birk.skyum@pm.me>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Renjiang Han <renjiang.han@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260913194707.91885-1-birk.skyum@pm.me>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260913194707.91885-1-birk.skyum@pm.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE1NyBTYWx0ZWRfX5TCO8m9gmLCk
 ad3NRCo3RTTfmC4ECv2f5LJ+1Yx3A/EfFOxdWHRu+sTioAhm83bREU++Z/aTrjYDPZceyL7scsi
 bGeqVdP/tjcAayS8O+DV7ch08KU73ZDgdQRcRIzioHX1YyDu71RmMWaG7i3VV/Q1Gv7CrjLQDNa
 Nzy3SxcCs3ODjClPTOt9FnsY39OliHyE2TSpWrRXiaHNpRfpY1h5N6j4IqI3gQhB16ZtGAL15Uv
 OL+ElHsbyo20MEg9+YMquzbv/zTClar+8B9tVhmHnz0d+3CygH24JaQu7jea9Eo4QkU0ZZ1GZwu
 /dfTkRLAnxJ15vU5m4aK36OlumTfqlm8vlTKDFRwsYfcrEpbUXs0LCLSuFOKPs0N+xarzoLJ55/
 l3XX40/UZVtT/IP4Q6MHJw7rL0H9qWg6InQFSzb9smQx+SSS8p8NV5JC42+Fj46TMxkuFYdb0bn
 T4ScZF8wRTG9YQ4cvCQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE1NyBTYWx0ZWRfXx3+XuuQx8HRN
 ds++XxI5WO+z4ZJpFL/W35Uxr3qubRffACEcj79U320ZCsv2kmwWg4UxA3HT0ealv2J9vuiG2bj
 G/XcaiPBfUG+uE7ZG1jtm79nGuwNcHw=
X-Proofpoint-GUID: ziUxoUc_JTRXekp3mzz6COw75zOrlfOM
X-Proofpoint-ORIG-GUID: ziUxoUc_JTRXekp3mzz6COw75zOrlfOM
X-Authority-Analysis: v=2.4 cv=K+W3jCWI c=1 sm=1 tr=0 ts=6aabcd12 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=/MhRiX8TZM4BB34AAREmLw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=tHeYVxIKKmQc6YDT4v4A:9 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170157

Hello Birk,

On 9/14/2026 1:17 AM, Birk Skyum wrote:
> Hi Vikash and Dikshita,
> 
> I'm testing Iris video decoding on a Lenovo Yoga Slim 7x (83ED, X1E80100).
> This is a request for guidance on a firmware assertion. It currently
> reproduces on a modified test stack, and I'm working on reducing it to
> an unmodified-driver reproduction.
> 
> After repeated runtime-suspend/resume cycles, VP9 startup intermittently
> hits this firmware assertion before initial stream settings or CAPTURE START:
> 
>    VenusCoreCtrl_InitSS(506): un-expected SID override configuration
>    WaitForHWidle(462): VENUS is idle, no HW is running
>    assert_loop(500): FW Assertion - venusCoreController.c:507
> 
> The first HFI error is 0x05000003. The SFR names the same source line.
> Later venus_c2_parsing.c:1550 assertions follow automatic recovery; they
> are not the original failure.
> 
> Could you clarify what the SID override check expects on X1E80100, and
> whether there is a known firmware, secure-firmware, or resume-sequencing
> requirement I should check? Which diagnostics would help distinguish a
> driver sequencing problem from a firmware requirement? I can test a
> targeted diagnostic or patch.

Same failure was seen once in windows based X1E80100, and i was informed 
that doing an explicit GDSC (vcodec) power on before doing a warm boot 
i.e iris_vpu_boot_firmware() helped the case in windows. I have checked, 
in iris, iris_vpu_power_on() would get the vcodec GDSC on before 
iris_vpu_boot_firmware().

I am gathering more info on SID override configuration part.

+ing Renjiang who is helping to debug this issue along with me.

> 
> The firmware is qcom/x1e80100/LENOVO/83ED/qcvss8380.mbn from
> linux-firmware-qcom 20260810-2:
> 
>    video-firmware.3.1-e5aea20c64cb6df9a1c9be99e206053b36424939
>    PROD, build May 9 2024
>    SHA256 3456a15e01528c2ba2957ef2b78daefd875841b262dc02f0c3bb03c33cba657f
> 
> That hash matches the current linux-firmware main file. The BIOS is
> NHCN62WW, dated 12/02/2025. The device tree lists qcom,x1e80100-iris with
> the qcom,sm8550-iris fallback.
> 
> The test repeatedly decodes the same synthetic 1280x720 VP9 clip, 120
> frames at normal speed, closes the decoder, verifies runtime_status is
> suspended for 100 seconds, then starts again. FFmpeg is 9.0.1 with a local
> fix to requeue empty non-LAST ERROR capture buffers. Successful runs
> match every decoded frame against software decoding.

Could you please share details on the FFmpeg test and the local fix ? We 
will repro this locally to get better insight of this issue.

> 
> On one cold boot, three 100-second idle trials with power/control=on
> passed. After restoring auto, two suspended-idle trials passed and the
> third failed. On another boot with auto throughout, two passed and the
> third failed. A separate codec guard removed an unnecessary AV1-only
> partial buffer from VP9; its warning disappeared, but the fourth
> suspended-idle trial still hit the same SID assertion. These comparisons
> do not establish runtime PM as the cause or keeping power on as a fix.
> 
> This is a modified test stack, not a pristine-mainline reproduction. The
> kernel is 7.2.0-1.1-aarch64-ARCH-camera1, with camera patches. The in-tree
> Iris and video-clock sources were built as external modules. Iris also
> has experimental initial-CAPTURE deferral and pre-start buffer ownership
> changes, a bounded HFI/SFR diagnostic, and Renjiang Han's firmware-logging
> patch with an early debug-queue drain to retain the pre-assertion messages.
> The failing session receives OPEN acknowledgement and its first compressed
> input before the fatal error. No looping or seek is reached.
> 
> Testing stops at the first failure and resumes only after a clean shutdown
> and physical power-on. No clock-module reloads are involved. I can provide
> the synthetic clip, exact source changes and filtered HFI trace if useful.
> 
> Thanks,
> Birk

Regards,
Vikash

