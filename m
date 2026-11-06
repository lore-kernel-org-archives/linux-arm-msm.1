Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793963541;
	b=YTe2zpyom5G6Cfzot630pQT0MfvwIct+c0o8SgMYKADNY3tsPJUPjaLzVrl5ZzAX9gEn
	 mXsRuyTA88BeQH9Jf14UEcapnlUc7/gzRp1Z8WNp6N8CEzDJ6HxMzEdBIB3/fVu89vEyj
	 yJNq+s9SQAkhC4RM+Xep4yv6k0FIsbC/73L0Cwto3naFi8J6VTLoBpF8HA5FO/mFnBuXV
	 5YOiKHxaeVJnrPzrOsIHhJn33ja1shsvkUGG3ME1HUIOsBUA/7oV3spY8oMxtFdRZL0Tn
	 jTxdMISoOhOBFc+CEpYOrj8H1W/8wIZz8NwWcNWeO9nybVGImgTubQF4mygGMbvixDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793963541;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Oo1iY5srrHI3dy5E5aRo79G2M/KKYPiAY2CEolYKGFA=;
	b=2DB15kmTjneniLHGTJBD4TjqGe0g+uc485ccKk2gIS055jTGaTbIBDdyjpwcK2OPsrMT
	 qNnDhxDhOFE/PRhIHXkjGaUZHpLjor8V6mBo0CXtemjv0SpIgU81kcZaPoX3yc3gJP3Ct
	 6LtOnF/vlSroY1QzHwz+3HKAoQfcH6u5w3oE05F7+PaLYpHvlD9G8MxDm2/j13ggH+tVp
	 4Da7InCM2bCfaRNchmlVZY9SwTHhVzWVQCf3It1tKA+e6Qxm8GlY+8Z2QY3eI2ZdgX0TP
	 9JkczjjI7ngmcdqFo7jhIojW88PX2lthSBhho0WGbaEl8PqoJ3cGJ8MSCWu3aE9MxBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m77hjIec;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cDkfHMaF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0900B606A32E
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 11:12:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0900B606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m77hjIec;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cDkfHMaF
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6APCc22076103
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 11:12:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Oo1iY5srrHI3dy5E5aRo79G2M/KKYPiAY2CEolYKGFA=; b=m77hjIecq+EtZy7I
	UWrtloMxqxzCaZ/Hsoy+bKxsZ3BAEYaC3etLDzVq/+WCa+BrCbFBVlEUEXHSQPrJ
	xp8ppoXjWPv17Sd/k6/oPBKojUd/9U0fyuUcgzrkK0wfuj0atyypUIEXNVOpfC/B
	OpvOUpgkkNKYoMvu01v9FzG+IlNiTuiWVJ8d1rwI9zi/Pu20hDUmAtft1D/Nlf4c
	ew+lUx4FJwbeuByDkuoJpkhrGVBy+1XXQch/J1Nh9v56aMH4GxmYRo4SNiGVIeh0
	OVSgEcN7K3HIosDobFX/uw89oOiOz9Nem1PwBQiStyJC7NnbrUe9B+NihPkVEBPw
	g5HWDw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pcag5m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 11:12:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93edac5877bso9671985a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 03:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793963539; x=1794568339; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oo1iY5srrHI3dy5E5aRo79G2M/KKYPiAY2CEolYKGFA=;
        b=cDkfHMaFJKtAcJEtgzsmZx7PCwN8S5MHNPfY2AxbF1StCQA5fBpYlNbfvvC3S+byLg
         x0SJ9NhOBf+pTNXpNG/dGzKL0wOvxbZLFHeT08+OMLXZb5xAVeBFj99ukq/52/K8otGN
         5qXSJ54TLPwO+xvLQWXjULP2ikHLP+ATwI3inVs/bOD0+SzG6LmCsaA613y4fRWfvfg5
         lO+L5D5RSyxifm41zES+M7q94p/W7KmKiJs0nlqjO7/EiT+vT6x+t2b43q9TODcIWUmh
         Ia8vbrWOM06HClAh3/gPeiFFt6VmUmoifPL5THCg6CJre7NlFnNiFFUkZEDvDCUKg9xI
         JPwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793963539; x=1794568339;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oo1iY5srrHI3dy5E5aRo79G2M/KKYPiAY2CEolYKGFA=;
        b=RtZsdy3rLAx+dhnYWoWPFWXGYy4Yko+3J4dRgR9xONfFgsRe/fIQvDvjgw6QoVy10E
         GNSQkxN0wHu/xCVznJ1R0VKeLx4uAANBQAcQ90+NwFaZvvX8uI8UUZ85RDDMiBtrAilC
         n9q4KlAmG5hZEFOa2OYCeWIoAGW+YJDDo8Zmuury9aDDcViirR+Y4GSXYlKfKcmiIpHD
         fS9Jd12emoabdsm5gssn1kYwdCmGIiCpK1nvXg8nrl1P+eYmjYC2Y3I+Cz3RiOEz/09W
         SEoEj5RbnrEnuhVGNzhk3MZyCNtDzAqVheC/DcpLfk1WLbP0EAJr+F9LWpemCR2Xm/y5
         k2KQ==
X-Gm-Message-State: APuU4Z/gK8eyIq4d3gQXT/HtOHM06SomHZXXTYm6ly4idKQ+POwNW3HB
	IYUbrZFu7rMp7uW4hM0A/avuAs0IE1NBRt4FT/mwj/MTWMZd1+mWyoiNJIZt3JDkSkorVbW1mOt
	fPSVvldyTK8ZlWvRNR+rksC8cdUYMaGsPZ6K2TQhdbXgH65VQmhnQ/v4dFsGshiXiLCKi
X-Gm-Gg: AYBFou2NtgJ/FWgIX/grBMM44hTkEiNArfLKXgazza651qHGW1ezucHeA3on45gpN0m
	kocxJx1EV3sTRga75YqKDuzycxkMJ1JlOIGfQdGHJhzHUpEQW6RRIhAfPZxJKrwyCG6mYo5sUGt
	Nw0a1IEt25DJTUjluLMh7gRXrnaWtZDEDIpHZzHBSCDE7vb2XtqaJFsLunS1v18d0NpGSPzB3Og
	SPaaSSe/1jXECGg8H0rTT9hMiT5QNi4DilUCrpFqgrmCYCQ1CV8BXzSeAH3DwbyP1oo/Bmqpnd2
	lUy0hy/CKoyyoHgTZ2QdHEMJDZpSxTABR1vIvYg24vCPSLKsGTs1c200jClBU2O0KO3VijK8oKP
	s0wkHZ4HbufujHim3BzqEzolezlmb/OfL5Zs0LO8gI0OEhacsqZb0ykjsKtZUA8rF+v+cQA==
X-Received: by 2002:a05:620a:a7ca:20b0:93c:c96c:a5b4 with SMTP id af79cd13be357-945f3548e05mr299337085a.4.1793963539325;
        Fri, 06 Nov 2026 03:12:19 -0800 (PST)
X-Received: by 2002:a05:620a:a7ca:20b0:93c:c96c:a5b4 with SMTP id af79cd13be357-945f3548e05mr299333185a.4.1793963538744;
        Fri, 06 Nov 2026 03:12:18 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d3566f7fdsm73268566b.31.2026.11.06.03.12.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 03:12:17 -0800 (PST)
Message-ID: <72bed879-9f21-4823-a1ab-7d8613d70dea@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 12:12:15 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: ipq6018: Drop undocumented
 'qcom,ipq6018-wcss-pil'
To: "Rob Herring (Arm)" <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261103225845.984564-1-robh@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261103225845.984564-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: INoVPXOqKzWu36NxCQRQwrPeS7QUQqig
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA0NCBTYWx0ZWRfX5Ji98XGV/uc4
 KaECx+mNHCIX0z+Ug5p80oqpkbhoIMGiRrVIjVktNDNErSvEEy3H+rAK0hGRxzumRdjt9/9S7ai
 b6Wj2qy+R2T/CwZ/8cARtnNcFQadFarpPsncNx+BrOdZf1ZfmzVSRelqWyFFzsBaPq/tCo8b7IV
 uVRhsDe1l3Rw6+UfRdFdwSyykle3EqzcMfjWjoP+5njnFOY9nBRLZU9TVQr/qLw8tbtQkFYtk6l
 EtJ0pN27iefOi/KTWaJ3TAmXsTWS2mIvllBDLWNUMBMR8fJHrJZRxoXQNv9x+3ocX3Xwq67Hkdc
 G6DpDXiCdJ8JJG5dl79f7bEjH9KXRw+a9QxmGCvk3HOKxJp4pxDcxKpu8hxZ6BCqo6P/WgzN4Jb
 qhljWiMs24Xy5EbpNEa307DYp12YXan+mX2RdPPMPopZXftmLvCvYmo+x1IodfACZu4n0kXM0dm
 lvFS+QRP0W+UTjh2veA==
X-Proofpoint-GUID: INoVPXOqKzWu36NxCQRQwrPeS7QUQqig
X-Authority-Analysis: v=2.4 cv=TI3Q2Fla c=1 sm=1 tr=0 ts=6aedb614 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=BGlS9vUawJadlalJgwIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA0NCBTYWx0ZWRfX1T+HTZNURbny
 8ao0qOXPZKUGQTNfNMsXZwp/7I3YHqjzmXrEfiIPbEcSV+CBVxJFWIrLocmYHA+HXFHBpiR/F0F
 s7dg1DQtz3bdY2q5ylyJEwCPefmhsoo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060044

On 11/3/26 11:58 PM, Rob Herring (Arm) wrote:
> The 'qcom,ipq6018-wcss-pil' is not documented nor used by any driver in
> the kernel, so remove it.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> Alternatively, remoteproc/qcom,q6v5.txt can be converted and this
> compatible added. I have a WIP patch if someone wants to pick that up.
> ---

I would gladly use the opportunity to make sure the next person that
touches this validates it on hw.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
