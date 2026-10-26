Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792992727;
	b=0Riziny3T0D2xYeyucSNGM8O8YQGPiAoYqMYsPFj40EpA9qjJKvnpri2l2ec9GEDPcqq
	 mDQGjS3KgEeErFET00LoYszh4Lo6tibOpEh+fFynPN/zLR+g5huat9z86j/J9hDPaqjzX
	 yvWXWKidlYMYDBMLni4Vce804CTIkUnfNjvPJY2oSMJN0NIOnk2SxVST0Xr0ucVGeCmCM
	 nx9wD/Fdq1G/M7CYeukgUM2t3z/BDdBFvFOSikYAapqaI67T0IsOlzBIHUxUv+5anGAuk
	 rdMB1Saj7Elmtj7hwm3md0tWjwOfpxOEKwCCK2rpPh8K1ggrnaDQG+OGvwZjsRRVZLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792992727;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+pIQ82vdej/2mAxE5Ss98Wl8RmyGvtFzNZ9cyB2WStA=;
	b=eBxZ+m4etH+jLhGJFmICxAH+b47FJzj71eGXUbiObPlGbCLaKEZis8vL4PAX8upkXvbR
	 ZLEadKOSmu1KW/UhnrOseRqOst44GQWffeWmJTyz3ncOqCwL3SZFzhZJop7qiwAwV3sjZ
	 +aysyShsHnKnHsZyAdD0MKtPTzidiS7tt9B2P59e1p/Nje1Oetutt8gYQmknIQZ7xA1Zp
	 0m5ZBUTn2+1ilFxioGubdYePKIxRybP6oyGTpsSN0bWRHXh4lUVNYSWJm/qtDXulTHQ+T
	 2i3J6MulLs/8rDgn1Lt3EfJHpgNybfYbseysDk073p9zpMEJXdWCXv6/JNfeoF1yzAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pjmq54yV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bnd9b3gr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECA5606A31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 05:32:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CECA5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pjmq54yV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bnd9b3gr
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4bKVD2206725
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 05:32:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+pIQ82vdej/2mAxE5Ss98Wl8RmyGvtFzNZ9cyB2WStA=; b=pjmq54yVpPurVyB1
	3dDQuNvDNwsRIAzCPtq+eS1bIKHv9qdfPTBCDZ9SYpmaYPNosDzHjw6kBn4VcrVG
	6eLUEJzA+ZHxSBHnaqXeArZSLPO0lkWfIU54HU6KkDaWWFepRO0pBLKyQNXuY9Kk
	bJuZCwbbsDBeC/ZQ4tGkwP9+PPqz2Te1Qppl+izvLhat3cO3AiX0aBDvgOoMj0Ew
	E68yXAiwV4R4OV4sLaizjjozKWw7Yfy3QtiaeQ/0Z6RmZlMZORDpfzxgXyrMw/mc
	xvkLYQJ5rZzZTkHRa4RqGq+tqJ6fNUraHbA+32eRPUHkHR/i2H/Fc0vnJpgD1ZnJ
	7oQDAg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmrumvsy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 05:32:05 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-189d17eca17so363950c88.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 22:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792992725; x=1793597525; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+pIQ82vdej/2mAxE5Ss98Wl8RmyGvtFzNZ9cyB2WStA=;
        b=bnd9b3gr6DoMnossatN68Cx9wMSwzCvXfgakBJbRMV/tCjnWcev6dTR/9MDoCbTrko
         wfy/mg068k0hEMEipJeeUxIq31yHZlggcR2c53liX5zgEO1uIShnuVvgFjMJ4SmI1j1h
         QLS4nVcCuE2KHs4Cc5XLE4W56qhlrLxH69rJkzyJ6O9HL36DaKbGu9XJRD0iWjHpJk2s
         uh3VNEKPbcy5HnjcRP4j4UgHF5Q1x4gWHNzIYMwzZ6sfDrdBQ08Asx2R8TAFufPjP5NE
         WaJIT4f8OvmOhNYeigJG5IsnSdFF11e5h3hKgewX2Ttki6ivHlc4FQ02jujVxuzRK1H0
         dw/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792992725; x=1793597525;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+pIQ82vdej/2mAxE5Ss98Wl8RmyGvtFzNZ9cyB2WStA=;
        b=ialtnSm3WEeFn+gyiCZD9VsGNNMAUNu1paBRZY/LJDrsA4ZYLZ9H5NwZ0/WGW5KZsh
         4FtuhS0WNM7f5WIr4SStPjc/mnGfSq7lv/yDZE2Z2GYDzec6eQeyODc9C6x43AaTmEPf
         ikgIFvFd915iAIurTlIz4jbd9YElk6YenCw3KgcMXmP84xUBhdCioHdXvIfsv5t/Gwot
         pm/BmDe8gCHNZHXlWikEQ50bMdRX+hl//tehPNwZ6DcC66VKFivyZSEZ+hp8zI2PMlTE
         BCyHH8lYWEF+juC+863USyymcvSNyyWPS5C4mzrfXMw5zbZZTQhCplPoU/uRgzW8HhwX
         Vwkg==
X-Forwarded-Encrypted: i=1; AKwUvBwuP0RN8u2n/fh/PMXILglKeDWNskyYA707rNSxht7hI6alFw3JvAHBS9KKLmrGcL7RutQMUYSq3rkTbsw/@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1pgXJGDuoq6bBnvqKK2vtETS1W/OR5vvXb/Mvd8s/EX4YU3GP
	zyUx8jFg2CFgi59C/dh6tzJwV1aSwj4lAAFi5txIE2CVEuocElH3d1gMZrn9bz1WluDnLjdD+x3
	GuXuKfkSRi4E1eefB+qZd0hoMXkv/oro/JT1u4XbA1gSa8hEDISJqoO6VwXP2jfpopTj4
X-Gm-Gg: AYBFou1SobZlPhVRE1VdDvLuF0LsJzf4p5nBJ4CLKzJlHOxh393q5T8ieI+R5VoM9mp
	QNSKGcfz+UzuhiG9gt3ksDVaJgtt/nf1nVZOGUKdUpz5QipNIWMEtyEuXYap82ACKNknm0MC+Wn
	cbsXrWPy7Mz2q+vsnhamWuxRqATmeIW7xoj3+fs9uiahbN2Qax38LjBONmMg5vpXgL+R1u9zvzV
	ORaKdSabO/gzb2cuNmk0EVCmHTIwaUeHVXHaB84Ih1p++ItRdiz4JqjP3bBs+c0+e5HZylEUiUs
	He3+aS2st7gICR6w87vRBa1HqvbEnty9D7cgsV0ULt/taAv5TMTubzatwuX2zr/LWap3E6Nqgi/
	F7RnDz02r6yK2Td5yWTfaUZSWjqQy
X-Received: by 2002:a05:7022:e888:b0:15e:3a65:5b97 with SMTP id a92af1059eb24-1993505df58mr9283563c88.16.1792992724848;
        Sun, 25 Oct 2026 22:32:04 -0700 (PDT)
X-Received: by 2002:a05:7022:e888:b0:15e:3a65:5b97 with SMTP id a92af1059eb24-1993505df58mr9283530c88.16.1792992724312;
        Sun, 25 Oct 2026 22:32:04 -0700 (PDT)
Received: from [10.219.57.104] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a064510b0sm1838859eec.2.2026.10.25.22.32.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 22:32:03 -0700 (PDT)
Message-ID: <d0f317a5-430e-47e7-bb14-b8d24678eddf@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:01:59 +0530
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
Subject: Re: [PATCH v2 4/6] arm64: dts: qcom: sdm660: Remove FastRPC compute
 CB9 entry
To: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@vger.kernel.org
References: <20261023090308.2898683-1-abhinav.parihar@oss.qualcomm.com>
 <20261023090308.2898683-5-abhinav.parihar@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20261023090308.2898683-5-abhinav.parihar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyMSBTYWx0ZWRfX0mA0gokxm3y0
 lNgp+PZkl2+1BwL7SYnFcBwUvXWvCUsjtKT+uYvoWHYM0WOuxa8gS4KSpVlCYdogmEgjobVoZxa
 5ICVrTUabwwHYftiRaxGI9VZKts/GzrYPKAQIqbJc2NyVuW6zJLMITGAYz39MX/0lbNRWjvcSqK
 u5/EExv7HKW89Zxma1KajO3lptNVMW+ctIwHspkUE7Ppk5MU+hsBLVaXmOSqC55SjVDS1hzmSbU
 alravy79TUM/2XOFwpLBaRcSn+DuXy0QuvY/E9UrDM8zGMVk003sOcaLbmnj7S8LirWSWgTpZfy
 AbSa9zeXCbcahm5lxbJ6saCXbGnos8KXfsDNYlS4ug2TPWfIYJXL2aqrpjxHwfBPjHWQ6gsBP/z
 eVzcc8VdUEJLouvPZ/+tbwNDbo+comQDzjyqAo2F5Izo7SZCnktAmuAXgWv7k0pGOZKgzhI3ONk
 MzGNfNN6Pf1m1JLFa7g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyMSBTYWx0ZWRfX/VuTArr3ewt3
 zPSZGS6LRlTjzZ6eLBxnuazH8DPV9Vua+7d1MDbDXcjGD4PTdhRTwSezHdkbvojTGbIT3TCPkfs
 hiGORTZm3S/Ut8a59cHHpbF/CApdQvA=
X-Proofpoint-ORIG-GUID: 07c5_wUgzu8SfiOaaLHuZ3Fy2s0WHAL0
X-Authority-Analysis: v=2.4 cv=e+aT2qp/ c=1 sm=1 tr=0 ts=6adee5d5 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fi4xyBuKck7nv7155uYA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: 07c5_wUgzu8SfiOaaLHuZ3Fy2s0WHAL0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260021

On 23-10-2026 14:33, Abhinav Parihar wrote:
> Remove the compute-cb@9 nodes from sdm660 device tree to
> prevent clients from selecting a secure context bank for normal FastRPC
> workloads.
> 
> Secure use case support is not currently implemented upstream.
> 
> Fixes: 708ab9d3bc5b ("arm64: dts: qcom: sdm660: set cdsp compute-cbs' regs properly")
> Cc: stable@vger.kernel.org
> Signed-off-by: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
