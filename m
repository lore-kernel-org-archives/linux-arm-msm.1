Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9044E4300
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 11:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791889319; cv=none; b=QkGD6qOyEd63gc6aVodXAv2n5mtmJeZNxIoR7Ffg+yk0ZuucDwp4nW+hVd+IG7kSrDfYb0/Mdb6JDoCV8PjQj3d8jSF9NY/tm0oqImUW2iZAlz0O42HP9gd6JQyfWqw2XCT124prCxMRcHA8UONrmhF9fWa1qh1ggY3TqrQBGsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791889319; c=relaxed/simple;
	bh=GHmwKE0UxwHRtrATAosll6uYBXuuBS4AK3dGPwQgzSo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QH368Xspm3z1sPfLmRY1+DModjhZlnh6c4DZgVKiBcvMm6mt5Ptw++ES4j3dF9nOI2orA9wRBcSawu04Fl+hELyDOFnbdT0Q30ZvEQfz79KvtPLXZ+MCFf9yVakFn310e2Rs1RVbav8k4XlbsqOkaQMLCdwxWhX7Z+FjFi7tfu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lOO7bPzZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kMVMHd81; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lOO7bPzZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kMVMHd81"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8HQJf988760
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 11:01:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ssf7iP1qlhqjDE4JINNU6Tu2kbsQUT2SzDqxYpnis44=; b=lOO7bPzZ3j+m7Sha
	w6srrquNg0hkyIjnQHnYDd9qR5MZcYdM+HiNIn/xELTL+gchT1bK4Hgbq+ysJFt5
	T5hhwZz5OcHyLWuQ6KiFKeAxlqx1l3fu0P/oGaB+rVfPEict6RnmqBRHX6pE2jZp
	fXaPDQVP/ZiO51olPrkL2ntXLAfG4wNUW7gdt9ULeHgUnl8nhas+s5y29aFSMEDr
	LWtOp9UOl/2e984qcgQ1Ch91+Ctjgk6rcwDFtvq8XSOYacwzu3r3PIqXwWGpC9X4
	S80fbSweiv9SoHCRPMYvcMBAF0SMmqf09/i1vGxlsgkv24miYfXzT2TDlGEoilVL
	/4lB+Q==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98hcajg8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 11:01:57 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7c2b7a15cedso66805137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 04:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791889316; x=1792494116; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ssf7iP1qlhqjDE4JINNU6Tu2kbsQUT2SzDqxYpnis44=;
        b=kMVMHd81pUEHlNNz2o4AntAnknqfZBWLjxJpWXgIXo4WEoZ7HTx5Tmg0rJ/YhvaPH5
         sBxyYBmXeYblde2/BnPakpZ8uEXaK3JQQSzGoqW/YwW3A7w6fNXKMIV20Uw3VJEcfiLk
         c2xrIyhpaF2k71zezPXBe3RIvSrHUaHgazj7IHcDDjXX513f6kISsAZzyuAG9W5G4UaV
         Nj13hr6DlDZrCWRG48SFJs2hu85aAyxV5n4aS6ScF0T9q+R0/jwVMAqedTCziaDaa3hn
         aKQw1CoK3XnhKgZbMSzFQkoQci3hocL/dSoED8arYNIei8QawIxH4LI/EdUskmuVLYxJ
         OJTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791889316; x=1792494116;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ssf7iP1qlhqjDE4JINNU6Tu2kbsQUT2SzDqxYpnis44=;
        b=ekqXCcQb2TunAp+TFob3YjMLoXtdCPmODylKQeXbJajRAYoeOmVY2fRFSwKo6T8645
         FnuxG9Sn8FZ+sciH/D1du3/9lLpGXIw7mERE7sWyvKBBK3Z+3P8UdRoeaDgF/rbErHia
         2Dg/dUsXhOwLPBgRXRiA5jsLfWCEDV0i7WjI15PpS76ezSq+FZ8jgzv0+cuaFRLJ6vbI
         TBrC7Yfi+3P0VbEGy1232S125Ofu1evlMYJek+hT58LpgmmQ3Db7QEP23WzmrgKhuKyo
         KBpdam/bMtQOTXmbFPP+XCo9avItTT13foZDcQLAz3XJj35j3bWPjHY/i2UB+gqdGM7B
         /aaQ==
X-Gm-Message-State: AFq9FYIIJFuVEWNZz4CnrM9rzqinnBu6sGNVhwsIT9EJoEvu2JQysMlH
	N+PHW+MTlMXtQE7DZ8j0zESQEUstkdqMCXOMMSv03T5E1q16cNQhy2+i3Xh6tNwUdSZuCtHRZLJ
	NXB6mWJHSwMcg+kPN7INYcVFRtSmDfJXLogblAgANQjNtMWe2gylq9VuKj6C/zh2CiFsH
X-Gm-Gg: AYBFou22CooAPYfDIdLFae5ts6h+9Dx/CpIJccW4imSYX1VQbXejxkUie4ecUhhWkx7
	pWpUOckwWgISm0vTHRGqYkSGHj75tyC6xYwkgsaJUG3a/Y64rz4JcyJ9LUkn+XfWQblw89XOLe3
	0UZV+3Fk1aF3CTvcDI7zIdGeCtHSyzWRGRzPNKdgOey5yMz1qZWrG+d5d9xOLcergwA2YMYtPux
	pUOh/D7MGrb48aluFdnE0dhUFa0ebHl7RmpPcuEt8jTYs9lsvtPd3UjthUmKjBxbB0SRNyVqUQf
	+W7lkT0TpkdNb4y1Hjzy8HAlchzQXADyQljKf+8z4VDVlJivpHHttGVeLjQS1Si1x6ahuqrmdUh
	8035OtNjzJ3F4nHIEq3Tnqg==
X-Received: by 2002:a05:6123:4204:20b0:5ca:7731:d376 with SMTP id 71dfb90a1353d-5e91f5370f5mr2310912e0c.5.1791889316546;
        Tue, 13 Oct 2026 04:01:56 -0700 (PDT)
X-Received: by 2002:a05:6123:4204:20b0:5ca:7731:d376 with SMTP id 71dfb90a1353d-5e91f5370f5mr2310887e0c.5.1791889316040;
        Tue, 13 Oct 2026 04:01:56 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b1da0641d0sm1640396a12.25.2026.10.13.04.01.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 04:01:55 -0700 (PDT)
Message-ID: <1afa3099-055c-46e3-b7ae-3921b8ecce3c@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 13:01:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 8/8] arm64: dts: qcom: kodiak: Desribe EUD UTMI routing
 and connector mapping
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
 <20260929213513.2401005-9-elson.serrao@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260929213513.2401005-9-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MyBTYWx0ZWRfXy/yMNNPr9RvF
 ZyfBFtPrYEbsG39PkW7EkYEmC4aelhKcDwKCj6snTbBEbqgw3uIh/Hkwx43XVJivxs6hiS3jGVf
 LvIqbp2woMEQDZ/AD7RKcZF9ym8x4xx70Wlnk9cO0mlrGBBkIZsTqq0jdS4Kdm+lVWsa9fpjW6Y
 vFcYwUFt2mKr/U6zU2zYNiEmzNwmW6GF4nvPGUA7eGiwlH+63Ly2IrIlYAuPe9fZzoCbax2x4FZ
 7mEvPHALKu4Hm2GsVYbZT3ejyE4S/JsRMh2iUW4byW2OL0T+zmpXcRM9HR/gCkvDewJClFqhV3Q
 DZ4qhlFl6cwfhC9bsRZQkhimHYr2zg0DXfB8Q+604HpfThVHtne3kjjkxLJZ4mGiKjG+4CYnTgK
 yF3t320bzG1bX6iehcFF5py0GrpGWzXsQDJ5tNXysRyeVSRIpyWLBUsNDSKUNonme7MKxy1ULMD
 YVYut6nz341uFd+QqKQ==
X-Authority-Analysis: v=2.4 cv=VPVIDNPX c=1 sm=1 tr=0 ts=6ace0fa5 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ZFXNGOwF0fqHmEQM8WIA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: xX2DHia0Kkq0xE7J3GmxlJsRjr9hkbla
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MyBTYWx0ZWRfX3yUmPPOaBTX5
 P6NmeceAlFCdPqDGHdfR9/qDoP2qb65kpgzgdVxh3xyY8v/leCxIFKeTmei5kYr92i5n36beJZU
 Dw1sq936z8S6D8sqttj2ED+r8CbtOM0=
X-Proofpoint-GUID: xX2DHia0Kkq0xE7J3GmxlJsRjr9hkbla
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130043

On 9/29/26 11:35 PM, Elson Serrao wrote:
> The existing EUD description uses a legacy single-path representation
> that assumes uniform UTMI routing. This was sufficient for minimal
> configurations where the USB port operated only in device mode and role
> switching was not considered.
> 
> Update the description to explicitly model the topology using eud path
> child node and add a role-switch declaration to reflect role-dependent
> UTMI routing. Also on this SoC, the EUD hardware intercepts only the
> primary UTMI path. So remove the USB endpoint mapping to the secondary
> controller and associate it with the primary controller.
> 
> With the intermediate EUD node now in place, update the Kodiak board
> descriptions to map the USB connector endpoint to the EUD instead of
> directly to the USB controller, reflecting the intended hardware
> topology. Enable the EUD by default now that the complete topology is
> described.
> 
> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
