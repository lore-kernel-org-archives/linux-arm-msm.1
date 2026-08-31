Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D743E558A
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 11:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788176319; cv=none; b=VI6N9MBBVSZ12oF5GzMVHY6WwCQsEGRF7DSa+k+xSd6F7h8UXIFIujTISQeN8NmDpel3Jd6+Z2mYEozYwqMz4PF+wz53SULh7v1njaZSDyV0RyZmdY2lsSk4O4IJWkVnnmeun8ZxdO2xYio2jlvUAPTrIk9I+/v4hVBa/jsjOBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788176319; c=relaxed/simple;
	bh=bI6pqxmvXsoz1GpoGopgL4gc7IEL9Fvc8zk5dX4p0o4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YF/8tTJXlXA63AY7TvL4edDDinXbvCy5HedYCfcfs5fHVH2Pf1YhYeGOUSMimrcAjSO3o2+1pVBM5JVkmTH6BadZhYUjXslpLhP8NGtCPUXbAJdkXxW1etdfcp7AJm/e763dDZlRQBgkw2tKTx+rrg6uLlRRhX+RUyfX4qDipc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ipr/5N7S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gmDNU1SJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ipr/5N7S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gmDNU1SJ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VBARIN2271690
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 11:38:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jsPV/3bKARA8qESe4FwN4opNWzg76gRAUiSgjeBLCOI=; b=Ipr/5N7S7NeaU8Qo
	e8vKAlwZcHYLgeIuop9bTGgmfOIUC3IOGUFzvYMQb+vmlAxt6RXmZamrx0BlFE24
	KtwxYSTKdZK1R8G2N1zZZxwrYoJ2oPO6L0YiMqxxhEhoxiC5/Xfd6b9FPLxOdoAo
	gjjaKxdYrk0z/+Xe+Y/E6BznC4L6zmqnxvLCcNpMBIcj5eEUYOwospceaNcajcsD
	J14PwCw6eQEsqT5JCSuI9UXWpyRFsZdiLRHZUU0b5dBblw4oaDdwohNyvIK17CFe
	Y3udyAsQBHOWmOrVhOFP05IUv7oZSu9iFArB/ZNpC8JKpoT0v02i48+DR9+M8k38
	Iv1aiQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6vagfnm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 11:38:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93821883e26so65625185a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 04:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788176316; x=1788781116; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jsPV/3bKARA8qESe4FwN4opNWzg76gRAUiSgjeBLCOI=;
        b=gmDNU1SJ0vic7EKl6v8qK84nrRNv66kQyw1zXCQzMnaz823SALVxZLkpub0o6tj6VT
         MO8jr56ogxBlmI/HTR+jB+mMT+oE0hS/ZryKhswpsTBX1/M6TdlioXyZLjfeE4BPcDf/
         5oYPIo9Ui9pdPuy7BPEdv9ANuhHrkCY3feg+a2IFacUF6l5aXPo1TU/Ojcbx69OGEvIK
         MbDYQojQ+HKOPc7dPVnOp7XLWnxkD5s2x3puH4dwD4nZzDmMaaBdVYDptAVeych2TwZn
         /ExD3tCCzWcVj1shv1svutQ7b8xDhskn29TT8p9sA49jGy5Ayuc/03TtNV1SxKXTCo/L
         qZzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788176316; x=1788781116;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jsPV/3bKARA8qESe4FwN4opNWzg76gRAUiSgjeBLCOI=;
        b=S/DGjqIJkPNsXx+7Vc+DUK4MQT+9v+icM3eCuCIGkuq5SIg3Sk/dCMgZWBy+cqidZv
         AZt7wxxLnbzakkinnkcpyF0rNxuDfzlevugrztHcer7ZphFDQ+6crv/SVvpwF8d+xCzf
         y33StTxPAaErmu7UQyy0FWY5EdsGQiIKjDMiAz57xx+PPsg6svB6WYcs5zTCmV+stw8H
         h9Aph6TMl+0PiVBcKMaijHKUyYra8f8nSUdX0TN8fPCmUGtz5pPnE5TOrfrhErAD9yDc
         9EqOMa1+p3YbBQN6VJusmSV/4LkWMMtc9xWNyHjtidd4hRt88BtxaMp/zCDggeR+CDQK
         mFLg==
X-Gm-Message-State: AFuF++nsTUtvZz5rQpcxr9s5tTMhsY0LmQ1nOCbZn0YCaRR/3GQoUeCN
	6pTpwaK5LCmVK2f9cerqnyfsZe0wAz49qQBpHwAeIp35buC+dlaDDhD9dHELCiV+bBg34zOOYnf
	/HTsNkIpEcVZTQR45zgs3DA0VLivlR8MXbD4nWiV2EtKa9D2WCbwdcoUmtQwklTpSVoap
X-Gm-Gg: AR+sD11H19bJpxu96yzvqyOrMRwKC53wBwBnBDPbkRROMpMxi5m//Ph9/qIQHJTW9IF
	fU0wLCyn8Ya2XMViS584Re3TTjlVhn1AJB2vqvmuUJWgaPNCwq3XgkQefSCKFKmcmpnoNqLGN/k
	O8LDb+z/3Y3YaVRxfdVHAfxDkWgNe4CVcroGg5XlbnONn17LdACySuRediTTSpA7u8DJeixL4he
	ydwKul/Jfxj7PJc4CtiIsl3mZzrp3z/mNFdd4KDxNZob0Qy+17vJIsBuqUx6E0PCEHqxPswM++F
	92OFOBCQw6TlwWMT5Jc721PHkQArcULLdEJ9pea0GZzEUEAPMQaRnCPh/SpkLU3sq+TocTTE+XM
	/YBzKxSjsfhwhb9XNQ8hQgQ==
X-Received: by 2002:a05:620a:3183:b0:939:2880:21e6 with SMTP id af79cd13be357-93928802232mr860871085a.5.1788176315783;
        Mon, 31 Aug 2026 04:38:35 -0700 (PDT)
X-Received: by 2002:a05:620a:3183:b0:939:2880:21e6 with SMTP id af79cd13be357-93928802232mr860867385a.5.1788176315284;
        Mon, 31 Aug 2026 04:38:35 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25ab254f49sm57028066b.10.2026.08.31.04.38.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 04:38:34 -0700 (PDT)
Message-ID: <5bb31efb-3855-41e7-b011-1a5a94fee59f@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 13:38:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] serial: qcom-geni: Fix port_ida handling for console
 and probe errors
To: Aniket Randive <aniket.randive@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org
References: <20260831-master-v2-1-0032ec7fd1ca@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260831-master-v2-1-0032ec7fd1ca@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEwMCBTYWx0ZWRfXwdQjOesaa2ET
 SGPUhvr2IDbStnxZRDlSmxEAGtNktc7KIbEjfIu+44c1zmBwv9+vk9NhUEODs3XQ1Br42yD4S5s
 Qukv45rN6q/V6LbdbaykpAs1hVsY5f0YD0TaiInUmeui43BizXdxM20/5rxq5dUXISuD4aGdo8W
 oxw69je35iT/vFJcHxuOxjl7VML5fE5uouNdiyVImYZ9uu1m+nt1edUTEG0F2GqPQlLyGujFRIN
 P990bZSsVDhzwAMbFpHIyKvXhqYvTCdGo/mRD635A3KeW/guFOA+Cw34U9wBBKcVbZkSFAKDIdi
 2NZA4m5JRLWPUt+Iu0PnViKeaJ3JaNNDBra6UjnSF4VdSW6YzQ/5zaC+POWfwn4jhLWA+hG2rOD
 +26+aosdJxb8HdRNt7kfmAHdT8/BiYiOHVeufv2wjRP5FLymhIa1TycDjCchXk3jrfry/HS59Wc
 ia8qUQHDeCDVEwasXgg==
X-Authority-Analysis: v=2.4 cv=YYmNIQRf c=1 sm=1 tr=0 ts=6a9567bc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=SusbOXjRFks2-79YJ0gA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEwMCBTYWx0ZWRfX+Ek2jHZI4yKD
 c28hKovT4Yy+OtwOZQkk19Anz7XHIhYlsB9Xv5fzjQu/gbb8JUOLhBq9KLe5FN2XRLOuIRk3dUO
 Vn67MprqqhQIrEvEffZgrj+Ju8e9wek=
X-Proofpoint-GUID: CegFWSOix40Srl5VT07fYfbtpQfUAPZt
X-Proofpoint-ORIG-GUID: CegFWSOix40Srl5VT07fYfbtpQfUAPZt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310100

On 8/31/26 1:12 PM, Aniket Randive wrote:
> The console port uses a fixed line number and is not allocated from
> port_ida. However, qcom_geni_serial_remove() unconditionally frees the
> line number for all ports, including the console port.
> 
> Skip ida_free() for console ports so that only IDs allocated from
> port_ida are returned.
> 
> Also release allocated IDs from the common probe error path. Currently,
> IDs are freed only on the wake-IRQ failure path, causing leaks when
> probe fails after a successful allocation. Move the ida_free() call to
> the common error path and guard it for console ports.
> 
> Route resources_init() failures through the common error path so the
> allocated line number is released correctly.
> 
> Allocate the port structure before calling ida_alloc_range() in
> get_port_from_line(). This prevents IDs from being left allocated when
> memory allocation fails.
> 
> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
> ---
> Changes in v2:
> - Route port->dev_data->resources_init() failures through the common
> error path so allocated line numbers are not leaked.

I asked GPT what it thinks again and this time it found that this
will cause a double calling of dev_pm_domain_detach_list(), which
will mess up the refcounting..

I think the fix here is to drop the manual detaches since the common
helper uses a devres-managed version of attach.

Konrad
