Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C147015A85A
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 03:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787627721; cv=none; b=h3EVFVWeZbn6dAvmfv3MhpJUe3RqLvScta5ilrC7lPbewDIaUMzw+QLyITzIlVcOAjEdnpD7hYJsnZ4ubaOunQeVXyf5rr3yBgnoPj7mofnFflJNZc59TXyMHhjse9E+SWZLISKvhCLvEM3NqzBXuWOhPVnXRuL/r/TF6dbY854=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787627721; c=relaxed/simple;
	bh=yPWrCzoXIqgAXeIruzKGmM/XEqVv57+pEiuntlLY9pM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TxJY9viWC+7KhRn3bX0WxmxS49BF4r+GPTadMQwKomJwXoAXSiGfGbEOrSurMxKM8C1z1qjjhpYO4NfbgdZtt3MeX7r4DAlOI22Gi/nFvnnB5OFLR2i0hTx6K0mh9TSaJ24E4K59LkocDpUQYk35FFt/a+yfDToM0ssUh6R85Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BpLqdgvd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mg2Vc9iw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BpLqdgvd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mg2Vc9iw"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P2R5Hr955241
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 03:15:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zw9BJ9wTlK9G8KvdBmOSxdt0qW2SYtUaRVnoZ3uGJ3I=; b=BpLqdgvdoswUs+IH
	0x3lJdhCyzU/6Lw8XTtjV3s8hKAuzFKENCdytC2CgkspdTClE3qoJgDKA0DhX+NT
	igSqdvRkkEAtghKnZsMWKyYEJiHJAmz2G7+YUHB4Rchn8hDAsO3BaRVltt/mveIh
	YroTGR8FTS4mzgkvGg2SBR7GTh86zi+cDOU8FEc3w0t3NtFGT77cqGSNo6Lx7TN0
	OGLFLmU0uv8/SX63TkaiMMBLsxJGk9n9WMExDRZ/tED1VqKXQJsUBE+iFwEAeYmM
	YVvRGtZ0V4AGs1iSBR1pYw97ctU0VS1xbRPv51XDTnUoAwhcxsRNEolVbmEZL48f
	3gKABA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hjgv99s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 03:15:18 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c85798977dcso7419189a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 20:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787627717; x=1788232517; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zw9BJ9wTlK9G8KvdBmOSxdt0qW2SYtUaRVnoZ3uGJ3I=;
        b=Mg2Vc9iwQ7+94JOcSN0TWLX0K+ImQdLBmxQWHDGGS1I7QhJiX5oy5JLgSgJJThgka+
         vGbZiaF3MDgq2K/1g072x+qIcXq9o5YOjl7Ju/AK+j88GMckxfVMajaET6Qrs779o/6w
         O1t3wy5XMyS1J+1d1kTcE4mozhPz88eGN59VyNiwloRcEGPOhRBhmZudoOMcAVPuTxnP
         YyWSyN9QxjcWR19UhbCJ5hW2cFqVvMw7BXovz1MH45O/Rx43IwZXXQiQjKab/ris5h+5
         9liPqcqxuWZWUiz04a5eXCnPGslr8nQBdAVc5LIFZ1N5yma2YUeW+1PO1aqkQniHnjeM
         HAAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787627717; x=1788232517;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zw9BJ9wTlK9G8KvdBmOSxdt0qW2SYtUaRVnoZ3uGJ3I=;
        b=rRhL7/0ulZ08UcPEZgIGHKPgrist2A71aoXvkskx4UHnWck9V6r+riwOEViSIRJFl1
         es6TAIcU/KqiGsz5dDxLZJXt3+9FvNvVK4o5vjyIJDvaVQgqCly0DO0UjjNZ/KEpQvf8
         +5tILsWQcS2gdbxKy+J/+ZinkfvcMr1c07xj7DM88tukT6LGQvhs0arHIu1UFDGAGW6J
         5DNMeBGeHnVKUAPAk+eboGugNPVNPF2iZe7/WQJxjv+APd+SmpCR6Pluz0S/saDpm1x+
         WXSXGWNyAnGaFA8Q2qjORYespP5wA7mIHEVqxKYWmbbfqeco1bup1Gt/gklW6z5SILDR
         i2iQ==
X-Gm-Message-State: AFuF++lp0ZU8+C7teyb9gDG31BtvkTrp/g+DWKAe9TBnkElARqYwX+sH
	NHvFg4c/kTtLhQQtcy3hGJd8jj8hdcRSRUO8c27CNnfUPex6VYVL0o1IZAnXioq7kmo7Hs5Quz9
	Fla/sIlEreTdKUM8hU33L/tpMUWjZaQEFTAyJjpP++b8l6XIRfLb/WZoMgnewUIbhFw4R
X-Gm-Gg: AR+sD11hhZ134+9Y8tGscZa1HdWSTZtLjdmUBNulhSA5/MOnnYIUkGzjdBtwQvl53np
	YfRgb5/ltHYGpudVDPDG0GV6gyhirT02RZakaTgaSROGRfyShFTQxzsT44kd63X+7Ben58fFHDa
	S3dEVlREycADXPkaddq8a245stDd0EPG+LPreHRz8JQyAdmQBNpCE+FWpDgX09aNbsv6BGGtJ5/
	ecrbl3qOHFybMjFuDmHnDOZ3Xj0Idt0YqeFKXNnftTP9oUelpV376eq1vWgj9l/iziFCN0aItH2
	a1/G+cruNTHjA8tc/bLSObfkiXADiUBRxOQJvAAtQFoV5tZm4t7EFqpkje4FtERF62nNg8UdvZO
	XBBHmu5HGLtrrOZszL/6W1bo2+2RLSw==
X-Received: by 2002:a17:902:fc46:b0:2d6:dfa7:fad4 with SMTP id d9443c01a7336-2d6dfa7ff18mr60428055ad.0.1787627717430;
        Mon, 24 Aug 2026 20:15:17 -0700 (PDT)
X-Received: by 2002:a17:902:fc46:b0:2d6:dfa7:fad4 with SMTP id d9443c01a7336-2d6dfa7ff18mr60427295ad.0.1787627717013;
        Mon, 24 Aug 2026 20:15:17 -0700 (PDT)
Received: from [192.168.1.132] ([70.95.199.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32801d7f812sm28570652eec.1.2026.08.24.20.15.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 20:15:16 -0700 (PDT)
Message-ID: <502df11d-c372-445d-99a8-512fdb0e9a4c@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 20:15:14 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/9] usb: misc: qcom_eud: add per-path role switch
 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Peter Chen
 <peter.chen@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260811213610.2956147-1-elson.serrao@oss.qualcomm.com>
 <20260811213610.2956147-5-elson.serrao@oss.qualcomm.com>
 <c0215cd9-3973-4306-85e9-d58674d6bc83@oss.qualcomm.com>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <c0215cd9-3973-4306-85e9-d58674d6bc83@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDAyNCBTYWx0ZWRfX3hwTEBmAjZvb
 7ui9APJ2sYWIDU24kOsiqoll8YapMxdqb/r5sszZjug5RTf3qqN24eNej8WlEQuCXNhWc8Jt0Eb
 anDKzpspNoAv5XEzkugRh/+bUHzFjQo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDAyNCBTYWx0ZWRfX332xVqAKQsxA
 0TNgQl2PlJC2Cw9V+fb3rV71+pMi1XnCMgAxaWYYEmrrAFySaJh82T4maMrUuEnPLOdTFLit5rN
 5/m6DTAwKh315DLLtH7x1vAmZbUU+SJKtZH0Ekn0532YZsT5glZyGv6bNMPD+sYKvbIgKMrQANj
 v0am1BSG1wZCRDt4g4hlNPF6a/AE3IQTYxh4yzsmz9QVlTyuOMYwMTRMizKw1z057xia0ZFP9RA
 dgfM0XfXrKo7ZygG35nfTFagF78Hs+L4zVIXJQwHFuW6AtO+sOK7q6axj69IkN7tKZJ7922T7S9
 Z3xDIpTKxt7jLMLNkjoYW5ipzyYO4MceHUkdH07NQMKZpAHJntPQDaUWmOTdw5iONwRtEb70d1x
 xvNbPL3P68wZU6ybJmKNV9PFsMgqowTajdzqm64CjFxIs/sAmX5+h9e+VLT1g1wnD/hr6lyNmx7
 99bH37Kj6R+WH0/8yMw==
X-Proofpoint-ORIG-GUID: hXwvk4qWMZvECNqltyUIpmdKnvPvhTMa
X-Authority-Analysis: v=2.4 cv=CoCPtH4D c=1 sm=1 tr=0 ts=6a8d08c6 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=uHxescsG3rBdxcXwcPaeSg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=L8Mv0my-441DvGKMhw0A:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: hXwvk4qWMZvECNqltyUIpmdKnvPvhTMa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250024



On 8/24/2026 6:44 AM, Konrad Dybcio wrote:
> On 8/11/26 11:36 PM, Elson Serrao wrote:
>> The EUD hardware can support multiple High-Speed USB paths, each connected
>> to different USB controllers. The current implementation uses a single
>> chip-level role switch, which cannot properly handle multi-path
>> configurations where each path needs independent role management. Since
>> EUD is physically present between the USB connector and the controller,
>> it should also relay the role change requests from the connector.
> 
> [...]
> 
>> +	if (!strcmp(dr_mode, "host"))
>> +		path->curr_role = USB_ROLE_HOST;
>> +	else if (!strcmp(dr_mode, "peripheral"))
>> +		path->curr_role = USB_ROLE_DEVICE;
>> +	else
>> +		path->curr_role = USB_ROLE_NONE;
>> +
>> +	/* No role switch needed for fixed role controllers */
>> +	if (path->curr_role != USB_ROLE_NONE) {
>> +		of_node_put(controller_node);
>> +		return 0;
>> +	}
> 
> IIUC think this is a bit of a convoluted way intending to say:
> 
> if dr_mode != effectively_otg
> 	return
> 
> I don't think there's much of a better choice in APIs here, so let's
> maybe just do something like:
> 
> if (host || peripheral)
> 	return 0;
> 
> directly (i.e. without making ROLE_NONE the "desired case" as that
> is very much not obvious)
> 

Sure. I will change this in v7

Thanks
Elson

