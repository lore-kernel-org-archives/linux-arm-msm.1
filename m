Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793771981;
	b=Ijt36tdtQhtE05n+shCkaI30Ig6zkYaxr0FszakW49lPFK4DxQYCNN3MogQvbEIGW0LF
	 uJrvAqhkaMtDjukFGj5fvHOBKn62CjQhOVDTM5y4HRQIzaNkncUZsslaeFo3ROmELOux/
	 H675vyW/jVCuobcrLmUUPtMo6zC2HvMkXa3WBYh8IZoN9RdG5dhux/u9j9uB5sBClbksn
	 S264z4M0N748ICJTHBO5+hGQ+oy2Rg4BwWNfNi0buqD2ZkdV/rWNwzuYQHS5STU2TgHNs
	 cKtl63BSEP5pOAZxZWGIHkHyX+ULE0CSbuIJiUpOQImEfZeqHr9uNcmH7wwUCfxQHvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793771981;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=n/G5Nv2dAlUVtrGNDcGhMOQixY/8gCyKW3v0jjm00ms=;
	b=ToTgbtq90SgX1/vPtc1geyPROWG5txiksCHg6Xs7Iz3hA1GwqjZSPxpMAeEmhV/8tkm+
	 ado2kKrj5SGP9iVbEU5K5r23qJhykXsj9K4iGPczABDjWnhxGRQ2tCk4mZ7R/e0ldClMY
	 UwGsYvgKxopKsWu920VgEqZGdHXDVzKKSuB2anUQHPVc/LB2ObFa/YtgIDJc66VJLHMso
	 VyEEImI5vEC3ceMKSA87FXfwhcl58VW/ACkkcdlKd4cZQxakVCXnTvc006N77y3lgWQgt
	 l1fB5kyCfjS9gy6OZaXPtYTTPlgruq6ekrn0V8kp7Mun1kf1i7eKdV8csabyHyD5wcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d1GSPKmF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YJALQzBX;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584FC606A32C
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 05:59:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 584FC606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d1GSPKmF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YJALQzBX
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40RPAx230670
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 05:59:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n/G5Nv2dAlUVtrGNDcGhMOQixY/8gCyKW3v0jjm00ms=; b=d1GSPKmFAXNQ0KoN
	vK55XA3+Fl69MwK9bpfTrs7vaWiSrDRjn1qhPAlBAyiv2Q9oRGPnNRYi4kfuhnRd
	5K3iyevL67uJZZ6HoFtKEDMuiGUEyXo/EBWeJvJd2ju7zqHzH9wa7dkQD7fvimus
	x5pC/Hz42w59lwh3qVNR/4knR16lorwIhTqUIjbXEdJYTFpx/6AQP+Eh7QlGvBqZ
	pYhfVRORuJF3o9vBkVnv0/iFqzxQxwf4VrLns8m4RvcUKtq7AH/YvQNT0d7LLgUv
	2JJGBy6mQSgPWbnzK8gQYxKegVERb1GoBzCuCrB+32CxOI+JwprvEERiSCA1ta8Z
	kUiEaw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqhypkcqc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 05:59:39 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ae1d132d52so479926a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 21:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793771978; x=1794376778; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n/G5Nv2dAlUVtrGNDcGhMOQixY/8gCyKW3v0jjm00ms=;
        b=YJALQzBXCh2yNwicKFAitCjRxTRC0Gx0Ar/cFXzMehLfm65NFVOKF7qQJHzoJP66I8
         nVUmyU3cuVWtURX+TN0nx9hT+fBJEJthNmryuMBNV608cTda17Rah5zV0pcVU9uNiivZ
         aNJyvLl2F4C9lEt0QgSvGORXnvh5v33ECHcEdmXvseOVdq5j76VTviB6sTB3zeHb8j3M
         tELT7V9B+UOND/ZAqCZc1LMhHavdm/rdfSF1K8qa1OUMWpG8Q2KMD4TihkagNjg68pu8
         N28zRUNKMLxdhy3lvEqEbnmrxDpiXQ8Cc7tbtQ4G+f55VcONIPppi3HpLp01ZkTKgK7v
         pylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793771978; x=1794376778;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n/G5Nv2dAlUVtrGNDcGhMOQixY/8gCyKW3v0jjm00ms=;
        b=DVEY+XGV/LlqYgGi3/9UZAi2/ZHX7yNb+TAOS3XlPzilD3TKHnlPEzD0HTcvVuuAuM
         KnGY7+otskKIUscLc6ZNoLH+kDKL2vWtwW2hzSYMjApvg5ekCsQe/LsKdkM9MtVTMRC2
         Rf2aBI3CI4QLzTySn8dNTQOeCTiaGwOkyRwMmS1nRE3l4cP4wkYNkMQUWeX2nfwCcm9N
         vEYfghBGuwG9/lDMb8CTIdF3kiWWqzy7NWueoPNsvKe3lEBilkljYMwpwOn8+KjWBqM9
         PGIgoV46h6NcAGug1ELU39nXnh8utlL0rR8Xx9Z7i4egqPsCCCIYG9IkP4YyclZ+HeVp
         kfeQ==
X-Forwarded-Encrypted: i=1; AKwUvBxnERW8WuUCdzqwux3xmwX4AmPpvsC7HjwxNlpx5PZYxdDOgTN7hZFjONIPBGQGPRZyhZt2iG5LjbUhPVJI@vger.kernel.org
X-Gm-Message-State: APuU4Z8iJNNTkdahbHQr1kI7mpa5uduM7OXzF4u+eS8X8yw6FU7xULQa
	sL5Hf///iKfWOb4e3OwNX7slT5WeZhPP6LIq90efHJqVXGgUF8z5y76UmcYtmh7b+fJgqybI5H4
	f+C1wiac/XDqHSnQ1yhuGSrhe3z23pzrRmhc3WMh0rb7h0QwmmTHyIOCxxzs4ENy/QmU4
X-Gm-Gg: AYBFou26LQ/U3SMhoZpTc8/c49+D4u9656RLnHOkI2Zl3u1lFyqkfjfgDNUxbwDBjbA
	Tr8MLNjoMMNev59ddM0PilyQ3xnCMK7AQXaYCOSNomR0v1BMD+gVEWBtO9JqMjvBGD/YsgB13Iz
	/gb5+wMYE45RL9qrukOWbNonl0nK7pyfA5p4FxC0/xakHIKZZuj9S2XHkdQzOHtX11X/InMgUS/
	+NtwNpyO81s+bnEun+6c4rF14ho8HnjzuHYbAOFHGo8Nlhb5TeDLE9ZKSimSPCMICeE5VZMz+VK
	Al/kfoyWbahWWu8o/kUpZmaRHGYMZZwKf4PM//3vfEwN7156DEVj+gzGlv1GUZ0Hx2KN+SjvcRO
	L87mbe7S/iBR4DPzhC8u7kSfOgNZJQdIRpS59+sl6hKNbfPQUGGYuHNoGM/1NulbVk3B1i5rsBX
	tg
X-Received: by 2002:a17:90b:1643:b0:3b0:9fbf:894c with SMTP id 98e67ed59e1d1-3b09fbf8e31mr161211a91.17.1793771977744;
        Tue, 03 Nov 2026 21:59:37 -0800 (PST)
X-Received: by 2002:a17:90b:1643:b0:3b0:9fbf:894c with SMTP id 98e67ed59e1d1-3b09fbf8e31mr161203a91.17.1793771977134;
        Tue, 03 Nov 2026 21:59:37 -0800 (PST)
Received: from [10.216.40.83] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0944bb7d0sm2197830a91.11.2026.11.03.21.59.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 21:59:36 -0800 (PST)
Message-ID: <501b80b1-6d65-4f37-8bf6-3846d9b7b028@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 11:29:27 +0530
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
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Subject: Re: [PATCH v4 6/7] usb: dwc3: qcom: Support firmware-managed resource
 states for power management
To: Peter Chen <peter.chen@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Sriram Dash <sriram.dash@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1793212717.git.faisal.hassan@oss.qualcomm.com>
 <d04522f9f972637133b8b080919f870e56a66395.1793212717.git.faisal.hassan@oss.qualcomm.com>
 <augrote-Sw3QO16d@hu-petche-lv.qualcomm.com>
Content-Language: en-US
In-Reply-To: <augrote-Sw3QO16d@hu-petche-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAyMyBTYWx0ZWRfX8dlQYeI6ht6+
 yyYoIQnmeDQxPD5bmyDj4wBgh5JHJw4IRHoap0T4hm+HPFdtw7RGAn8h5YBp/MNzmR/X6oaYPA0
 bj0bNOcavuoFBQJ8qV3xdW02Rk8EpA0=
X-Proofpoint-ORIG-GUID: -uJlOI3vLlRrZyPujJGM7gmceXjufltb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAyMyBTYWx0ZWRfXyjEY6Xpra2dg
 4JHZr6oMi0fhDLJmxmMfcDbzlTjvFsvOcF2P0wNwrg1I+/1fvxzEFifSc5LUMRX8hZvuANxRMcv
 MmmXoodtXQEkVM/QoEn/XB8MflU9mc2q7UHPHC8eRtyOlXcTQ0qw71MHs3BTA6f0zRobt4pfBvv
 Q8/bnU85d2EZjhM/LhkXW5XlC13pDyQeOptg+WRPUD2zAlnO+HhXl4vY1+W6pvnTsn6abeIQHJe
 XJclMIyK2mlAhyUQ5RWi37fsNqhFBHVo7Eoz6F7dN9lT8tFDIuk/Ao27iAytvLeAHbVbmAZLXZ0
 CUiCszugEBWLR4du54gavK7P5a17vo53Sf4JD1qX5GdRLA79JFrnNNdgnXPx0KgadO0l6hZQfwn
 OwBZel/Haw53dBwTre67f4vE/XZ/XIDLr1XPPq1hff5ESAKK5fu2qUel497mkAd9cU6UmZS30We
 Qnz9MbeUHFvz0nS3qDA==
X-Proofpoint-GUID: -uJlOI3vLlRrZyPujJGM7gmceXjufltb
X-Authority-Analysis: v=2.4 cv=T94Z3PKQ c=1 sm=1 tr=0 ts=6aeac9cb cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=RyKMRjjwCDUOkbTw7aYA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040023

On 02-11-2026 11:50 am, Peter Chen wrote:
> On 26-10-29 00:29:36, Faisal Hassan wrote:
>> Add support for firmware-managed resource handling in the Qualcomm
>> DWC3 USB controller driver. On platforms such as SA8255P, controller
>> resources are abstracted and managed collectively by firmware, and are
>> exposed to Linux through SCMI-backed power domains.
>>
>> On SA8255P, resources such as clocks, regulators, resets, TLMM and
>> interconnects are controlled by firmware. The driver communicates with
>> firmware through two power domains:
>>
>>    - "power": controls power supply (GDSC) to the USB controller
>>    - "bus": controls clocks and interconnects used for data transfer.
>>      Register accesses through the controller require the "power"
>>      domain to be enabled.
>>
>> The two domains are voted on and off directly from the PM callbacks
>> through dwc3_qcom_domains_get() and dwc3_qcom_domains_put(). Runtime
>> PM usage counting keeps each domain enabled for as long as it is
>> required; the driver does not attempt to track or infer any aggregate
>> device power state, nor does it assume what state firmware or the
>> bootloader left the domains in before probe.
>>
>> Runtime suspend/resume vote only the "bus" domain, since the "power"
>> domain must remain enabled for hardware accesses that can occur while
>> runtime suspended. System suspend/resume vote both domains.
>>
>> If system suspend is entered while the device is already runtime
>> suspended, only the "power" vote is still held, so system suspend
>> drops just that one. System resume then votes both domains back on,
>> which keeps the votes balanced across the cycle.
>>
>> The domains are attached with PD_FLAG_NO_DEV_LINK because runtime
>> suspend and system suspend require different supplier states. Runtime
>> suspend releases only the "bus" domain while retaining the "power"
>> domain, whereas system suspend releases both domains. Ordinary
>> device-links would couple both suppliers to the same consumer runtime
>> PM state and therefore cannot express the required policy. The driver
>> consequently manages the runtime PM references for the attached domains
>> explicitly.
>>
>> These votes are taken during probe, remove, suspend and resume,
>> enabling coordinated management of grouped resources according to the
>> controller's operational requirements.
>>
>> Enable firmware-managed resource handling for the
>> "qcom,sa8255p-dwc3" compatible while maintaining backward
>> compatibility with existing platforms that use direct resource
>> control.
>>
>> pm_runtime_put_sync() drops the domain usage count even when it
>> returns an error, so failures to vote a domain off are only reported.
>> Failing suspend on them would leave the driver thinking the votes are
>> still held and unbalance the next resume/suspend pair.
>>
>> While here, assert the controller reset in dwc3_qcom_remove() and on
>> the probe error-unwind path once the controller is powered down. These
>> paths are shared by every qcom,snps-dwc3 platform, not only the
>> firmware-managed ones added here. That is safe for existing platforms,
>> because remove() already fully powers the controller down and a probe
>> failure already leaves it unclocked.

Hi Peter,

Thanks for the review.
> 
> Since you do controller reset for all platforms, would you please split this
> patch for:
> 
> - Add controller reset for all qcom platforms
> - Add firmware-based resource management for auto SoCs
> 

Ok, I will move the reset on remove() and on the probe error path into 
its own patch, ahead of the firmware-managed one.

>>   
>> +/*
>> + * Firmware-managed resource handling
>> + *
>> + * On platforms where clocks, interconnects, resets and the GDSC for the USB
>> + * controller are owned and sequenced by firmware, access to those resources
>> + * is exposed to Linux as two power domains:
>> + * - pd_list->pd_devs[0] ("power"): the GDSC supplying the controller
>> + * - pd_list->pd_devs[1] ("bus"): the clocks and interconnects used for data
>> + *   transfer, which additionally require "power" to be on for register
>> + *   accesses to succeed
>> + *
>> + * The two domains are voted on/off directly from each PM callback that needs
>> + * them; there's no attempt to track or name an aggregate device power state,
>> + * since the actual state lives in firmware and is queried by voting through
>> + * runtime PM, not by mirroring it in the driver.
>> + */
>> +
>> +/**
>> + * dwc3_qcom_domain_detach() - Detach power domains
>> + * @qcom: Pointer to the dwc3_qcom structure
>> + *
>> + * Detaches all power domains.
>> + */
>> +static void dwc3_qcom_domain_detach(struct dwc3_qcom *qcom)
>> +{
>> +	if (qcom->pd_list)
>> +		dev_pm_domain_detach_list(qcom->pd_list);
>> +}
>> +
>> +/**
>> + * dwc3_qcom_domain_attach() - Attach power domains
>> + * @qcom: Pointer to the dwc3_qcom structure
>> + *
>> + * Attaches power domains for firmware managed resource handling.
>> + * Returns 0 on success, negative error code on failure.
>> + */
>> +static int dwc3_qcom_domain_attach(struct dwc3_qcom *qcom)
>> +{
>> +	struct dev_pm_domain_attach_data pd_data = {
>> +		.pd_flags	= PD_FLAG_NO_DEV_LINK,
>> +		.pd_names	= (const char*[]) { "power", "bus" },
>> +		.num_pd_names	= 2,
>> +	};
>> +	struct device *dev = qcom->dev;
>> +	int ret;
>> +
>> +	ret = dev_pm_domain_attach_list(dev, &pd_data, &qcom->pd_list);
> 
> Using devm_pm_domain_attach_list, the dwc3_qcom_domain_detach is not needed
> any more.
> 

Ok, I will switch to devm_pm_domain_attach_list() and drop 
dwc3_qcom_domain_detach().

>> +	if (ret != pd_data.num_pd_names) {
>> +		dev_err(dev, "domain attach failed (%d)\n", ret);
>> +		return ret < 0 ? ret : -ENODEV;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * dwc3_qcom_domains_get() - Vote the firmware-managed domains on
>> + * @qcom: Pointer to the dwc3_qcom structure
>> + * @bus_only: If true, leave the power domain untouched and only vote bus
>> + *
>> + * Votes runtime PM "on" for the domains this call is responsible for. Each
>> + * call has exactly one matching dwc3_qcom_domains_put() call with the same
>> + * @bus_only value on the corresponding disable path; runtime PM's own usage
>> + * counting is what keeps power on for as long as bus needs it, without the
>> + * driver tracking or assuming any prior domain state itself.
>> + * Returns 0 on success, negative error code on failure.
>> + */
>> +static int dwc3_qcom_domains_get(struct dwc3_qcom *qcom, bool bus_only)
>> +{
>> +	struct device *power_dev = qcom->pd_list->pd_devs[0];
>> +	struct device *bus_dev = qcom->pd_list->pd_devs[1];
>> +	int ret;
>> +
>> +	if (!bus_only) {
>> +		ret = pm_runtime_resume_and_get(power_dev);
>> +		if (ret) {
>> +			dev_err(qcom->dev, "failed to enable power domain: %d\n", ret);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	ret = pm_runtime_resume_and_get(bus_dev);
>> +	if (ret) {
>> +		dev_err(qcom->dev, "failed to enable bus domain: %d\n", ret);
>> +		if (!bus_only)
>> +			pm_runtime_put_sync(power_dev);
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * dwc3_qcom_domains_put() - Vote the firmware-managed domains off
>> + * @qcom: Pointer to the dwc3_qcom structure
>> + * @bus_only: If true, leave the power domain untouched and only vote bus
>> + *
>> + * Releases the votes taken by the matching dwc3_qcom_domains_get() call.
>> + * Bus is released before power since bus register accesses require power
>> + * to still be on.
>> + *
>> + * pm_runtime_put_sync() drops the usage count even when it returns an error,
>> + * so the votes are released regardless and errors are only reported. Treating
>> + * them as failures would make callers believe the votes are still held and
>> + * unbalance the next dwc3_qcom_domains_get()/put() pair.
>> + */
>> +static void dwc3_qcom_domains_put(struct dwc3_qcom *qcom, bool bus_only)
>> +{
>> +	struct device *power_dev = qcom->pd_list->pd_devs[0];
>> +	struct device *bus_dev = qcom->pd_list->pd_devs[1];
>> +	int ret;
>> +
>> +	ret = pm_runtime_put_sync(bus_dev);
>> +	if (ret < 0)
>> +		dev_warn(qcom->dev, "failed to disable bus domain: %d\n", ret);
>> +
>> +	if (bus_only)
>> +		return;
>> +
>> +	ret = pm_runtime_put_sync(power_dev);
>> +	if (ret < 0)
>> +		dev_warn(qcom->dev, "failed to disable power domain: %d\n", ret);
>> +}
>> +
>>   static inline void dwc3_qcom_setbits(void __iomem *base, u32 offset, u32 val)
>>   {
>>   	u32 reg;
>> @@ -380,8 +510,20 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, pm_message_t msg)
>>   	int i, ret;
>>   	bool wakeup;
>>   
>> -	if (qcom->is_suspended)
>> +	if (qcom->is_suspended) {
>> +		/*
>> +		 * Runtime suspend dropped only the bus domain. System suspend
>> +		 * must drop the power domain too, so that system resume, which
>> +		 * votes both domains back on, stays balanced. The usage count
>> +		 * is dropped even if this fails, so don't fail the suspend.
>> +		 */
>> +		if (qcom->fw_managed && !PMSG_IS_AUTO(msg)) {
>> +			ret = pm_runtime_put_sync(qcom->pd_list->pd_devs[0]);
>> +			if (ret < 0)
>> +				dev_warn(qcom->dev, "failed to disable power domain: %d\n", ret);
>> +		}
>>   		return 0;
>> +	}
>>   
>>   	/*
>>   	 * For runtime suspend, always enable wakeup.
>> @@ -397,11 +539,17 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, pm_message_t msg)
>>   		if (!(val & PWR_EVNT_LPM_IN_L2_MASK))
>>   			dev_err(qcom->dev, "port-%d HS-PHY not in L2\n", i + 1);
>>   	}
>> -	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
>>   
>> -	ret = dwc3_qcom_interconnect_disable(qcom);
>> -	if (ret)
>> -		dev_warn(qcom->dev, "failed to disable interconnect: %d\n", ret);
>> +	if (!qcom->fw_managed) {
>> +		clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
>> +
>> +		ret = dwc3_qcom_interconnect_disable(qcom);
>> +		if (ret)
>> +			dev_warn(qcom->dev, "failed to disable interconnect: %d\n", ret);
>> +	} else {
>> +		/* Runtime suspend keeps power voted on; system suspend drops both. */
>> +		dwc3_qcom_domains_put(qcom, PMSG_IS_AUTO(msg));
>> +	}
>>   
>>   	/*
>>   	 * The role is stable during suspend as role switching is done from a
>> @@ -456,13 +604,22 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, pm_message_t msg)
>>   	 */
>>   	dwc3_qcom_disable_interrupts(qcom);
>>   
>> -	ret = clk_bulk_prepare_enable(qcom->num_clocks, qcom->clks);
>> -	if (ret < 0)
>> -		return ret;
>> +	if (!qcom->fw_managed) {
>> +		ret = clk_bulk_prepare_enable(qcom->num_clocks, qcom->clks);
>> +		if (ret < 0)
>> +			return ret;
>>   
>> -	ret = dwc3_qcom_interconnect_enable(qcom);
>> -	if (ret)
>> -		dev_warn(qcom->dev, "failed to enable interconnect: %d\n", ret);
>> +		ret = dwc3_qcom_interconnect_enable(qcom);
>> +		if (ret)
>> +			dev_warn(qcom->dev, "failed to enable interconnect: %d\n", ret);
>> +	} else {
>> +		/* Runtime resume re-votes bus only; system resume votes both. */
>> +		ret = dwc3_qcom_domains_get(qcom, PMSG_IS_AUTO(msg));
>> +		if (ret) {
>> +			dev_err(qcom->dev, "failed to enable power domains: %d\n", ret);
>> +			return ret;
>> +		}
>> +	}
>>   
>>   	/* Clear existing events from PHY related to L2 in/out */
>>   	for (i = 0; i < qcom->num_ports; i++) {
>> @@ -699,16 +856,21 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>>   	if (priv_data)
>>   		qcom->broken_suspend = priv_data->broken_suspend;
>>   
>> +	if (priv_data && priv_data->fw_managed)
>> +		qcom->fw_managed = priv_data->fw_managed;
>> +
>>   	qcom->resets = devm_reset_control_array_get_optional_exclusive(dev);
>>   	if (IS_ERR(qcom->resets)) {
>>   		return dev_err_probe(&pdev->dev, PTR_ERR(qcom->resets),
>>   				     "failed to get resets\n");
>>   	}
>>   
>> -	ret = devm_clk_bulk_get_all(&pdev->dev, &qcom->clks);
>> -	if (ret < 0)
>> -		return dev_err_probe(dev, ret, "failed to get clocks\n");
>> -	qcom->num_clocks = ret;
>> +	if (!qcom->fw_managed) {
>> +		ret = devm_clk_bulk_get_all(&pdev->dev, &qcom->clks);
>> +		if (ret < 0)
>> +			return dev_err_probe(dev, ret, "failed to get clocks\n");
>> +		qcom->num_clocks = ret;
>> +	}
>>   
>>   	ret = reset_control_assert(qcom->resets);
>>   	if (ret) {
>> @@ -724,9 +886,33 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>>   		return ret;
>>   	}
>>   
>> -	ret = clk_bulk_prepare_enable(qcom->num_clocks, qcom->clks);
>> -	if (ret < 0)
>> -		return ret;
>> +	if (!qcom->fw_managed) {
>> +		ret = clk_bulk_prepare_enable(qcom->num_clocks, qcom->clks);
>> +		if (ret < 0) {
>> +			reset_control_assert(qcom->resets);
>> +			return ret;
>> +		}
>> +	} else {
>> +		ret = dwc3_qcom_domain_attach(qcom);
>> +		if (ret) {
>> +			dev_err(dev, "Failed to attach domains (%d).\n", ret);
>> +			reset_control_assert(qcom->resets);
>> +			return ret;
>> +		}
>> +
>> +		/*
>> +		 * pm_runtime_resume_and_get() is correct here regardless of
>> +		 * whatever state firmware or the bootloader left the domains
>> +		 * in beforehand.
>> +		 */
>> +		ret = dwc3_qcom_domains_get(qcom, false /* bus_only */);
>> +		if (ret) {
>> +			dev_err(dev, "Failed to enable power domains (%d)\n", ret);
>> +			dwc3_qcom_domain_detach(qcom);
>> +			reset_control_assert(qcom->resets);
>> +			return ret;
>> +		}
>> +	}
>>   
>>   	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>   	if (!r) {
>> @@ -790,9 +976,11 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>>   		goto clk_disable;
>>   	}
>>   
>> -	ret = dwc3_qcom_interconnect_init(qcom);
>> -	if (ret)
>> -		goto remove_core;
>> +	if (!qcom->fw_managed) {
>> +		ret = dwc3_qcom_interconnect_init(qcom);
>> +		if (ret)
>> +			goto remove_core;
>> +	}
>>   
>>   	wakeup_source = of_property_read_bool(dev->of_node, "wakeup-source");
>>   	device_init_wakeup(&pdev->dev, wakeup_source);
>> @@ -804,7 +992,14 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>>   remove_core:
>>   	dwc3_core_remove(&qcom->dwc);
>>   clk_disable:
>> -	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
>> +	if (!qcom->fw_managed) {
>> +		clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
>> +	} else {
>> +		dwc3_qcom_domains_put(qcom, false /* bus_only */);
>> +		dwc3_qcom_domain_detach(qcom);
>> +	}
>> +
>> +	reset_control_assert(qcom->resets);
>>   
>>   	return ret;
>>   }
>> @@ -817,9 +1012,18 @@ static void dwc3_qcom_remove(struct platform_device *pdev)
>>   	if (pm_runtime_resume_and_get(qcom->dev) < 0)
>>   		return;
>>   
>> +	/* Also disables runtime PM and marks the device suspended. */
>>   	dwc3_core_remove(&qcom->dwc);
>> -	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
>> -	dwc3_qcom_interconnect_exit(qcom);
>> +
>> +	if (!qcom->fw_managed) {
>> +		clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
>> +		dwc3_qcom_interconnect_exit(qcom);
>> +	} else {
>> +		dwc3_qcom_domains_put(qcom, false /* bus_only */);
>> +		dwc3_qcom_domain_detach(qcom);
>> +	}
>> +
>> +	reset_control_assert(qcom->resets);
>>   
>>   	pm_runtime_put_noidle(qcom->dev);
>>   }
> 
> There are so many judgements for qcom->fw_managed during the main flow, since
> there are only resource management difference, is it possible hide the differences
> for the main flow, and add some qcom USB resource APIs for them, eg:
> 
> static void dwc3_qcom_clk_disable(struct dwc3_qcom *qcom, bool bus_only)
> {
> 	if (!qcom->fw_managed)
> 		clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
> 	else
> 		dwc3_qcom_domains_put(qcom, is_all);
> }
> 
> For calling dwc3_qcom_interconnect_init(qcom), if it is fw_managed, just boil out.
> 

Ok, I will add resource enable/disable helpers that wrap either the 
clocks and interconnect or the power domain votes, so the suspend, 
resume, probe and remove paths no longer check fw_managed. 
dwc3_qcom_interconnect_init() will return early on firmware-managed 
platforms, as you suggest.

Thanks,
Faisal

