Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FB84AA1EB
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 18:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791828759; cv=none; b=SZwPRolm+oFa4I+cGHkXSKjFlBGXUZQr/o5CTOrn/94tpbGirVetVwUS7+9mbkyw7BBZ51kmjl0pa+PL79hVNF8YBwHTeXWwrBWXtNvF1kMGVeErROAOnA8tHYiF7Alu6e+p1lSBE5lGtuFXuRAtw2i7PsjX7BH9W3WNgsSHzSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791828759; c=relaxed/simple;
	bh=xMOB+Xeswh/VHG1JRXbW55ogVP/Sfyg4N3upBRTPGH0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vEkjZWZosza775bpQe8sq5Iauhx+JXwNfpmtPtnbkaBncv+2OByDA49CqGpcCPiv20SwvUEpHg/tEPS1nBG6noA9E/scYR1Bfaho2hnuzhH/EZsSjlkOvA5nhbfl2KBht2YDPePR3ZUO+yY99WQeRG4moR9V1Ivyiw1UaLwNLMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YNSM7lB4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Noq80VJB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YNSM7lB4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Noq80VJB"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CHv62c4086162
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 18:12:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	218J+j7wE8PIduGE71lICGhFvQKcwEnxX938pBY/Ais=; b=YNSM7lB4JH/yNGny
	CkiKnKe2Q/7w9vBoMyHJg/uLWTnONhHn5J+/1bsPsEAs9AUyIxXShnRefFp3lNN7
	5hqZyXp2gMfq9tjuyE4TlUWUQ2IW36U8gheCFvniVwXnJy8RETjpu0u0qjqWUgGI
	7iZCLRvwUy6/ZpMWCRXTEj27D6TzlX9+IdQh4vawLxl+t8yNoEDxfGJ6xvpRLVcR
	Ao/FfP1gSDZgFLvTgU9lCXKYwsPWi32FZmAd9aBiB1Sam2FeWMfCtsKkyphgXDSI
	IN1E8sbVGedTsfCtjh7QWbRGXiG03Oc5S/YOd6iBR3krdFZcDZIV7mNW+5wlBPPr
	wxa4/A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8uh3jtb7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 18:12:37 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-351788121cfso15169eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 11:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791828757; x=1792433557; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=218J+j7wE8PIduGE71lICGhFvQKcwEnxX938pBY/Ais=;
        b=Noq80VJBdkDsTop9jfBPtASzuH3378inM5C3trX88Qqht7uSdKZZURNAmyMVPjNKig
         zK9dNHcx/3MMgPE22x1yNMOuxhdBzA8Y3r5TlY+764deUTsjqgfaIwamx8VgNFFZIwad
         G8sa68cgnvh8+70PjWOt7oVzoHnvjRz74lclx7brXP31URmkwp2mozHrL9Thxl82txrk
         6OHX/uOnwfwj8x1/P6l82bMIYiO1jbOZqm359B9MlAgAaIycmYgVuAg01CzjT72FR/i1
         8B5XUjhILWnXObhREvNzgUkFZ/485zuUeuKllJ4A3fpGvzkhnulKoSTvJD0qlSFmFBDQ
         p4dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791828757; x=1792433557;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=218J+j7wE8PIduGE71lICGhFvQKcwEnxX938pBY/Ais=;
        b=xzShVrQ7CVQfBM6SKj+tgEJA4mI3mNQMowhaa+Pi0V4GIQ/gsgzsDM3m5pEnn5ESwy
         2NdiW9K2im9QNDYj4mBu8VrzCWQrkb05Xt5/sVhdWMFjKctRw9dbUqax7+twgVK/tyK4
         rQPeuAYCWZf5icKhljJqECc1midstrIez+vclEWjiBnywUvK5dSuyBEbIP2J+2oyit4v
         GSDMkFkj9r706wuci+5odBPC6PIJm9GVxdIPLqmhECjfeHYgLu2Wfl7rzsmQnKiU43p/
         z1QGVQOHQ36b43fO0bhdLY7D67a2dAsGuFIwUW5U3uIzt7GgKnpg6Ttqw9ouRt7OI51t
         L3tA==
X-Forwarded-Encrypted: i=1; AKwUvBy3D8aojBwNG3p6cm9bWlpwANm38hVWgg2USztvOdOVsquY60/zv6EFrUpHnUd1fY5NVH9pOP5SQedDkc7P@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3ENDoyD94wMOBPabRPqQNGNsjmFKaz9kgKAX89yM3Ki5sEU0i
	03IjRfdSNAHBa9EFRzku1zy+SU4MDceJbzERONUWnB0UQWzCwi++8WwvEmXLg9MBGu4AqrIAbHR
	qXdDjWBeWlKFRsQY1qvKpZpSZ0r4SQP2zNIhygcz6ZsGbkWbbTVfl+0c4TpitFttfoE4K
X-Gm-Gg: AYBFou0HQtpKQChmqfFTIP+/9CiosuW1DOiOIwzJeH7zgMsHJJXC0G9yZ4nCf5/Ymkz
	aaD5LZU2zp3LVpZkPtsL0aY+XHyYobpxBweuvams4GnORWWZqPIyrRdnE8PiWitRLu/OqM0+VYM
	vRQSEWIK/OOVe2cgiIVn18JkI5NRCdf9cVuGPZtiZS8JtA1tcUXaOyz7yimc27j0vfEe8p7u2KK
	dOy7XKZxDD7gYwY/hBr32EB921VUuwdF6lLe3jXb+EQLH83Djz9JpP8QJl8qu/BOUugbYKJarhp
	gbLB8r4lUpTsvCV+kQvvuZnyNaoP5Af3E2M0eVcTx3FPyi9hSFLa0v4hj97LWnZk6Fsc7x+hb/z
	Ivtdy/BE68gLQrrl3/vjcl4rFEw5ChF4=
X-Received: by 2002:a05:7300:6822:b0:35b:bb89:231e with SMTP id 5a478bee46e88-35bbb892336mr1842532eec.29.1791828756625;
        Mon, 12 Oct 2026 11:12:36 -0700 (PDT)
X-Received: by 2002:a05:7300:6822:b0:35b:bb89:231e with SMTP id 5a478bee46e88-35bbb892336mr1842396eec.29.1791828754450;
        Mon, 12 Oct 2026 11:12:34 -0700 (PDT)
Received: from [192.168.0.215] ([49.205.115.55])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841648sm40504487eec.3.2026.10.12.11.12.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 11:12:34 -0700 (PDT)
Message-ID: <1997618b-1350-4b67-9168-794be3e40683@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 23:42:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/7] Qualcomm Sahara protocol enhancements
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, mhi@lists.linux.dev
References: <20261008-sahara_protocol_new_v2-v7-0-90d278bd7414@oss.qualcomm.com>
 <asu5x72z9-p0U8G0@debian>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <asu5x72z9-p0U8G0@debian>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA3MiBTYWx0ZWRfX//a4gGkfsSkI
 XlwZWECa/G1VXTLpWz03P/5XTQ9KUQiNv0v7zFaV+bLLmQORRPsyTolmDRR7jmtBV0lFKUZuuKL
 hAgrbGYAp1ePV2dJ+DdpsXVfJZp8tO4hQnMlBcZAZ2/RN2JOUlSmNsaBwm+bicYA1RevFkQZn72
 adSqnLWA/aprtswZSSdfINti+lxzbAKW90NRs+PnvYRVdQkyqA8YYgBNNDKoQ5DEvUa7M/axVjT
 g5M3hdWp1qJuHxn3naS5OgfcGW8Gx9N4ZqVJVply7iId/GMELA8tLdVh0oqNsv9ncVFF9uOOhJG
 hWcn+LTW+w8L0emlwRw1NvlDzhcxAcPpoQdc3C4dBdHpYlEGFxWvZgzgu967Kz6jq07crcpCvFJ
 YI/Sg8Cd9TZgl6c8XavYhlvTemholyInLoS9RIvrvha8u83W219mz+1NKk8Bc91g1GcdBZA1YP8
 IGhEQRjuTOtMgfumMKw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA3MiBTYWx0ZWRfX+ETPbDNMlifw
 QHsA3nTd0gq9/Z+yQX+BZ9JCytrzys7DmY2k5+CSnOrkd16osCOGTIdIz/VVbMWLO9vklGJ3+46
 dxBYVw2+x+5nrd1IWiMkKqm8cZVIRvI=
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6acd2315 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=rMnsrh5NOwviKPWndHUBiA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=YvxDvPKW4DV_tE5yJ3MA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: z5gutV3If0JcJ0s02Kt4tBV_VGTBOmuX
X-Proofpoint-GUID: z5gutV3If0JcJ0s02Kt4tBV_VGTBOmuX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120072


On 10/11/2026 10:03 PM, Manivannan Sadhasivam wrote:
> On Thu, Oct 08, 2026 at 11:53:44AM +0530, Kishore Batta wrote:
>> Hi All,
>>
>> This series reworks the Sahara protocol driver to make it reusable for
>> multiple MHI based devices and adds support for capturing, restoring and
>> exposing DDR training data using the Sahara command mode.
>>
>> The Sahara protocol is transported over the MHI bus and is used by multiple
>> flashless devices to transfer firmware images, retrieve memory dumps and
>> exchange command mode data during early boot. However, the current
>> implementation lives under the QAIC accelerator driver and contains
>> device-specific assumptions that limit reuse.
>>
>> Some MHI devices (for example, QDU100) expose the sahara protocol directly
>> on a "SAHARA" MHI channel and rely on command mode to exchange DDR training
>> data with the host. The existing driver does not bind to such devices and
>> ignores Sahara command mode packets, causing training data to be dropped.
>>
>> This series addresses these issues by relocating the Sahara driver to the
>> MHI subsystem, centralizing device specific configuration and adding command
>> mode handling for DDR training data.
>>
>> Overview of the changes in this series -
>> 1. Move Sahara under the MHI subsystem:
>>     a. Relocate the sahara protocol driver from QAIC accelerator tree to
>>        drivers/bus/mhi/host/clients directory.
>>     b. Register Sahara as an independent MHI protocol driver.
>>
>> 2. Generalize device matching and configuration
>>     a. Allow the driver to bind to devices exposing the protocol on a
>>        SAHARA MHI channel.
>>     b. Centralize firmware image table selection at probe time using a variant
>>        table, instead of scattered conditionals.
>>     c. Preserve existing behavior on AIC devices.
>>
>> 3. Add QDU100 firmware image table support
>>     a. Add a QDU100 image table and select it based on the matched MHI channel.
>>     b. No separate client driver or registration mechanism is required.
>>
>> 4. Add Sahara command mode support for DDR training.
>>     a. Handle command mode packets(CMD_READY, EXECUTE, EXECUTE_DATA).
>>     b. Query supported commands and retrieve DDR training data from the device.
>>     c. Allocate receive buffers based on the reported payload size and copy
>>        raw data from the MHI DL.
>>     d. Store training data in controller-scoped memory using devres so it
>>        survives sahara channel teardown.
>>
>> 5. Expose DDR training data to userspace
>>     a. Add a read-only binary sysfs attribute under the MHI controller device.
>>     b. The attribute reads directly from controller-scoped storage and remains
>>        available after the Sahara channel device is removed.
>>     c. Cleanup is handled automatically via device-managed resources.
>>
>> 6. Document the sysfs ABI
>>     a. Add ABI documentation describing the DDR training data sysfs node.
>>
>> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
> Series fails to apply to mhi-next branch. Please rebase and resend. Since I'm
> about to send the PR for v7.4, this will miss the upcoming cycle. But I can
> queue it once v7.4-rc1 is released.
>
> - Mani


Sure Mani. I'll rebase the series onto the current mhi-next branch and 
resend it in v8 version.


