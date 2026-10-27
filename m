Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793106788;
	b=rvGtTY7jQvpUHWRdn3k5K05oZI271yPiAqxMR7054R2t/33cpEo8OJecI4aKvZ0pz0yz
	 zG1PnQirLPzkYFvaRZ+Qkxs1u+XvKT0JUcdNxPW9zadWktnPzIUK3WJ/RKtbOY6qbk977
	 2Fp5YG0V+k6aPuIQrlsy3+yh2DCWDkk136Cs/hL3XIQd23VlBgJcxwvOKd90F+86gUwjv
	 SFHmEQ0qYNusS3VctE3y5YRrSmB6gh3SRYC4XrBoyPP6NovJjRQfSbs1kIfnKMZzedodq
	 QsbBebgdedvLPVkZkzGQeUcAmUXGq3wKXlNCfJ9qEuizcxYxBIzjtTHgsA1oKIvkZBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793106788;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7WvmV6i+t04NVkQBEVgPIfAREv8DxyMHYZ9gaoAPyvQ=;
	b=Y6uYGvLFCSv6ALEaTOb6E28/Gn4sFhYt8kdpw/4E/iKuYX45QCxKdNDMrFXzxjCIKUKg
	 31suFNi+CvBM904sFp23T5+/QXPJ1zVSLy+Y8reWImqZ5C7zN1HWE1YfsBlmVZzb2tCnJ
	 7xKI2F/U+6RFIRr1N5V/qK2U5WyREpxtFuujIEmdB7lbJ+TC+m5BHtpQIXeoj6TPyDonJ
	 wA2ToWi5aR7z3CltiDHyhnz6n8FRt+Yplf3TCuZnt5mDDUyzeczukpUOeXeEo6bos2DWF
	 QrFvVVnReFmIgrvak1UrYLHSWMRtLNK+uM8lnQk+45EQWtVzM7VubsEIfiI5wIT/iGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g0SkaBPo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LjJfy47U;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F49606A31A
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 13:13:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6F49606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g0SkaBPo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LjJfy47U
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RCO7f21124837
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 13:13:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7WvmV6i+t04NVkQBEVgPIfAREv8DxyMHYZ9gaoAPyvQ=; b=g0SkaBPoD2DSomoW
	C/Pw36ZqeeBH3PkKVjeb01huIbylnMejQecjdd/n465bfDGvQoTOWnhfvBXi68rS
	7ttyexsHI5SS0rtOdZ/IYu1OJHAzOqYV/sVcdE6mVfkIQcxn0L94yuMv5b+M+OKM
	3KXhN5rJ4uF6ty69PN5AtnB8CoCCwQX1nTqG7xrStx8virnkdZcIxybKj40k/ZOl
	TuIcPXFX3Cq6FBwhLcRvCxX6p4orTbFEa+4zEJ498NuGt7DF8Gm6V+olhU3vGBGw
	wweFAol6BJ+DtDGa7tf0eEhmAXe5XyiLZRE0SyeQdn1HHVyEeyxoKiUDp6XkgISo
	m4k/Jw==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjux9866p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 13:13:06 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-4a72bcd6599so4063692fac.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 06:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793106786; x=1793711586; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7WvmV6i+t04NVkQBEVgPIfAREv8DxyMHYZ9gaoAPyvQ=;
        b=LjJfy47UB/6Xk8eCpfZEwBLMiZ3QuxxE6qJvFivEUIFPJy1i1fB189Kt1u7nPNdw/3
         ePz+OaNJq642NfGlVgIn0dCqcUhI2yRSdpDbOnjO8h/ZN5VJqms5c+Am0/xGtAxtepbT
         w9KrDrDVfs2JHxULqm4Z4tEImTBCuc8UOmWsP198a6E9Jy4aOwCDAj5e5zwRShsb4vlD
         9DOwlaH/U1rop62YSEb15XV5WSoRXHhMU5lKRKGUcRM8X+U+lrng2HQDDPja5oejDM9e
         XoQmnzelypEyrgaMGw8yqssvNVJchqH3yWxjYTcMtlZ/yBpwYWIT42p6OzZS1C6Z08o4
         uh3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793106786; x=1793711586;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7WvmV6i+t04NVkQBEVgPIfAREv8DxyMHYZ9gaoAPyvQ=;
        b=N6xLeHWTYVRMrlMrDCVkGLPLy4qj277NljI/pYxmAXAA7z9/O4tWHmPNcyGOvKxohB
         V9OYAxVLFI4kgvZPslZjzq9Ih82ClpZ4NA57XbH2JV60v0BaHKjgta94oZAwYkSSHru2
         RVKca+ANtybzzEom0rFTmQCdnAR5PxvJpkTIcF5q+3kdFwOC/JXHTxk7njgvVNsiG8Fa
         J9WcnrZYEubAqwmLsNB/ED13fgftWi0XQgDAaL7QOsTf2lv2aRXrAqM07h9/nGa3Ul7J
         Gq8WbdOKwS2yWed8lT03vC4tLlx91/MWUy3kW8N36XCVMg8yoWTjaDtJcJFp+mRCf8Fh
         6lkA==
X-Forwarded-Encrypted: i=1; AKwUvBwe631LBMOBgHG2x3uZlVUzNOolHBZLjhNpjgK3jG+K77OAQbIph2710ykz7Sdq+Izt9rMwXmxzMovF9cL1@vger.kernel.org
X-Gm-Message-State: AFq9FYIP1PUJcXYbhoSbZaCvYsBiwBwgeEQb/UuTTV7zhVQV1WEkT/gd
	nMS/CBjxmnixWWZy4U+X0DPWObHFCmojVu6aVB5HliQFyRkbgs/OEdSoE6BKYMtNMWNQpeNes/K
	/zUCvSGvfXDrJboTrTSb6ZtWAcMYsHUcAwxBEiDjFMd8kDNgab/N+kR8WsDk3VDuKcAia
X-Gm-Gg: AYBFou3DIdpYo68jZIZ4JV+0LrbHx7Pcx+w6VHb69qrcCzCMuT5lG8JtVG54qgJ72BB
	B2GP6J7mkiI5J0R/csQ3DVJNk4GuCxLo9PbYN+U9Ez5ENQ+KMOd7CFmtEyIck6QBEC36ZZmrmD5
	LZJlBn4+Z594MAZFRTB8MfVrKgBmYbYXAOd0q/BNCm4dO+j9JG9mBGjWjl1r4S8ddn/grNk/aL0
	1D7dN7M6VYK/zcyySIE7MXiqZzvK9JHeXzHcc1P6fehGArM4mZvYVlqgR/iUv3g90ypM/W4J1sS
	lTdVoAUTo34F+zP/Z2GPyCCKlxSCZLlzuq0+hJm9MZB4RhPZo7mm9c8T5vJs/YSLDOlrJCpjWN5
	unXPQaYOy8XRT4bMsPJLoDCKCXB5ckmA=
X-Received: by 2002:a05:6871:2114:b0:4a7:c737:5a11 with SMTP id 586e51a60fabf-4a83f40c1e9mr5690935fac.20.1793106786038;
        Tue, 27 Oct 2026 06:13:06 -0700 (PDT)
X-Received: by 2002:a05:6871:2114:b0:4a7:c737:5a11 with SMTP id 586e51a60fabf-4a83f40c1e9mr5690892fac.20.1793106785324;
        Tue, 27 Oct 2026 06:13:05 -0700 (PDT)
Received: from [10.219.57.214] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a8b74c0a7fsm11511fac.2.2026.10.27.06.12.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 06:13:01 -0700 (PDT)
Message-ID: <1276435d-7102-42f7-ad92-84c61aed6d2c@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 18:42:06 +0530
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
Subject: Re: [PATCH v2 1/4] dt-bindings: misc: qcom,fastrpc: add iommu-ranges
 support for context bank
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261007-extended-mapping-v2-0-5dca3aa2c2d3@oss.qualcomm.com>
 <20261007-extended-mapping-v2-1-5dca3aa2c2d3@oss.qualcomm.com>
 <20261009-space-crane-of-prosperity-bba4d7@quoll>
Content-Language: en-US
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
In-Reply-To: <20261009-space-crane-of-prosperity-bba4d7@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GYyCDgXL c=1 sm=1 tr=0 ts=6ae0a362 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=eYkptJB4znfycLMIrrkA:9 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-ORIG-GUID: jGOt5s_FI592EtgF28P9h4DGqebHbEAP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1MiBTYWx0ZWRfX1ezyI8vC3Vmr
 nlTFAXJXff/HVhX62gqr7vUOjnoU7Dlrj+anV1gnKKXTKU0SVHkp4iwhHhudUNox3uWLzZ9Z7o0
 mLnJY7W4uo856QGR7ok22/6eDd4gLw3bAKezdYEuKUvPgWtrZzvL1i7dyAWfGU20fEyC81jXMp/
 EFfrviI8x4qSJMis/pNpTEw9/CkqeUPbfPXc359xi1vTPhTwuW6i/+YgnmQAdEOx1D88oDrVTBn
 0u2WWBOm8LGME7XWWVVkmcpfMozTvLxxnMvWMHwK8MWx6grnQhFON3JC7nfmO9UPdb0K74ZXDlZ
 vqYOatOlK+2ze8c3c2UUoSabvBWZ9PjKK/K/bXWs+yKx+/8Gn6HIFHpsx17o2g+WXBfXeBx00Ov
 QIQBrYeCplAY5yXfadV5jz5StuGgDM6ekdVxqSSlCCx/zh31ej1pUnHDfm7CMuurgs0FUGYvHnz
 Nlp2dt5HmIFvvrx2zow==
X-Proofpoint-GUID: jGOt5s_FI592EtgF28P9h4DGqebHbEAP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1MiBTYWx0ZWRfXwyzXrnOkXmG+
 zUMXGemNXowiHCf90Wupdr8fyiRvwx2k3JdC91J2yFcLsayO/c8iFW2ZdWbKbSQkDhD7BCLfYdM
 aFzv1K5rbVKDVXOkek78AogQY5oXeqg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270052



On 10/9/2026 3:26 PM, Krzysztof Kozlowski wrote:
> On Wed, Oct 07, 2026 at 05:07:48PM +0530, Vinayak Katoch wrote:
>> The driver uses the presence of iommu-ranges on a context bank node to
>> identify it as dedicated for extended IOVA mapping. iommu-ranges lists
>> the IOVA ranges the IOMMU allocator may use for that device; any range
>> not listed is left unused.
>>
>> Add iommu-ranges to the compute-cb subnode properties so the DT
>> validator accepts it on context bank nodes.
> 
> Example looks incomplete now. Please add a new example showing complete
> picture of this device with all new properties.
> 

Sure, will update.

>>
>> Relax #address-cells to enum: [1, 2] and #size-cells to enum: [0, 2] to
>> allow platforms that require 64-bit values in iommu-ranges to pass
>> binding validation.
> 
> Which platforms are these?
> 

Kaanapali onwards, I'll update it in the commit message.

>>
>> Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
> 
> Looks like this needs some dependencies.

Yes, it depends on v5 [1]. That series still has open comments, so I'll
wait until it is aligned and list it as a dependency in the next version.

[1]
https://lore.kernel.org/all/20260926-vpu_iommu_iova_handling-v5-4-0322ca5dc10c@oss.qualcomm.com/

> 
> Best regards,
> Krzysztof

