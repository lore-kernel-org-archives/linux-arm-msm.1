Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296EA2459EA
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 03:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787628523; cv=none; b=Hg3yYg8VNfYcwwIqjqzuoGkneb+gP49H+aQsEXTorgH9+NPUjF8Juzl+JCPNxvdPRJ9XMs26LKT49uWBuLScLEGgIck/XiVhz1NWNzdzsDD8PEFR0o09nxiquKZH5PDadMt9wDzuyUjXtD0/5i2wwZsyTnNgtYX9XwgXG+f5PhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787628523; c=relaxed/simple;
	bh=vuiFROzEsC+g1XxUvKEPeCnooqPCI3YWqjwXN6cL/rk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PbVpTJI4MZxCY82fVm62m+uLr92xWueBmBnrUYxBnc5WBjvbnkXIq8Gl/pMCwehbZiFQFBg5qS5pJZ8Sz+PtDygj+A/DVUlhsi5EE937L5sbI2ts7DZtn5mxDz3Ju8FPml+fWWqTpEKElKiPbYkaE1hrojNHVp489qIII1EgIfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sk5kKTFi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jEV69Tg1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sk5kKTFi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jEV69Tg1"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P2R4pU1633783
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 03:28:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CSiqRQOs0eoPECWmncRej6CsGnfaG7zegCnVzga5O8E=; b=Sk5kKTFi6hd3qAmc
	DHnTG6U9WmqxBBtyV8nygQdbUh9dmXKmE3p7qQo707486h6xXCqI31K7tgYDrttj
	2UgdTUylxFuK2O5r6msJldbRb3u987EhfCDf4c/isquHmINPJpA0ZoXxXUFnWHE7
	hAqEG0TqvVa7KBjoS0Y9vrOtFGf13xPPA9HRE/SzZVtD8yG40bevk4CDGe4g/WQl
	zwuW4JGIMiGW1GKJXtyaOb7tS8NiISjhGWxSOV4Ry2jphQBZ8bHKdus8KVExtXdZ
	C2AxuX4sM0ARaxhaWWOhHcrO+EYsqVtKYwKeeUZiSSDDDJhx6ZhRPDYq283z08Wv
	sDKRkQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8swr9yn7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 03:28:41 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cce14a21faso4863685ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 20:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787628521; x=1788233321; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CSiqRQOs0eoPECWmncRej6CsGnfaG7zegCnVzga5O8E=;
        b=jEV69Tg1f2ww6BOqo3ZdLmqUt+bQrvISGy3swfY+uQdF8P5c+zD6UNw5lycSwlKGhM
         H0RBLlsZZ6F90oB/+IVtZzFjtb9baref0uVtWvWWuuPuIbDgI1utKontc4YBW2+x54db
         W6ppQLgbmUmFA1uid6oirii5nY5RlYZYM0639KEJ4+I60A0Fy9bRELqJEWdYj/XKQLTM
         JhoFbLJOPitwcq0VZUgE1skfJn36rSLnQGWJo5QfXNrT26NWzLo/h1PneNnSLsRPq4Bv
         OVnr14NhT5JethueCUM3Q8fzf2fcYWUwn/owTcsJ8npNHIEboNx1xZAmZxBmdZ6ShYiq
         +Sdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787628521; x=1788233321;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CSiqRQOs0eoPECWmncRej6CsGnfaG7zegCnVzga5O8E=;
        b=LNj9Tuc7oe3IHtERGBCkSEX8frb17R0ATpvha+jLUlUcf+YoMaWYc5jG2KJJRuWnDO
         D6pKIB//yV2p0iSz/+G4XYISjtJTkmgTp0GMGljVvdkuuf2zUNXTrcVCXr6mwJhMR6rY
         h8bSpEG7tNykt7HU3PdG8uYruNobbnvnYJCSSYuTnoFPB8/NVf6mOy7y2JHZ2yD3UMyM
         +DB57A2IZ2PCNI5bE9dFppCaXoiwtIBAwOA2fhIh3WWe/IkbBhWti3/xGua2b/u9bPgm
         BSLUGCskmSmvT+k/odKtIEom5S3LwNFlsHh5J2BYgIVzEqChMZXQxyf/rtu0QLvIESfI
         3AfA==
X-Gm-Message-State: AFuF++mtThl2YfN7hCPdr3SFuq/bPcEqdmEqWJaWTrrRZysEvGDSOJv8
	XEMJUJO4VxO3QOkNSOKMuSYarTk4eDbqODB4Lh0NcfXXL/OGzFcL0C9TO4Tr3+gbL9EUGoPqEY6
	wjs/Qt0GysZc46ppCpc72vFT1BON6OgtE2vDPO8JzR/fcd98xfsZ64YwNFO6kk5BTZslH
X-Gm-Gg: AR+sD12xbp9t9H5EDLC8K63owEg/hOa3dii7x1fFtXwSXxZjaSomVSUlNrdSYpEInCB
	PjbXkC3BnEkxrJWSOMdnnSo1dmSySfhVAeWashdYVKr1s7o2GOlF4tJj5mNsFiyamVcaS6i6oO+
	FhONM4aGe/ofz5t8UuZxXduweolYc2mzIzm2clTvSYG+cOyzyqt/QEovaZ0PufcZVYZYIFTR8LU
	/hUxgoPNshD1HcQHajJJBsWgGa9W94TMfDVFgir07cMYiuVfKzPRrM20giadnU4b5dLNSmzPyU0
	01teMsy1JeZyru8D3mWkxHBnPU37gqtR9n2eycRZC7oGjnyuTphtHDaE2rcdHmlSoD7kL0DDG+X
	Oj1fFIaxt5EuBBOLpoUJitn6lYauiDQ==
X-Received: by 2002:a17:902:fd88:b0:2d3:7122:833 with SMTP id d9443c01a7336-2d6dcb1a6d0mr47860555ad.15.1787628520674;
        Mon, 24 Aug 2026 20:28:40 -0700 (PDT)
X-Received: by 2002:a17:902:fd88:b0:2d3:7122:833 with SMTP id d9443c01a7336-2d6dcb1a6d0mr47860095ad.15.1787628520256;
        Mon, 24 Aug 2026 20:28:40 -0700 (PDT)
Received: from [192.168.1.132] ([70.95.199.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f90c0a59sm38057474eec.9.2026.08.24.20.28.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 20:28:39 -0700 (PDT)
Message-ID: <9a556733-79db-4f69-a149-b678c23cab7d@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 20:28:38 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 8/9] arm64: dts: qcom: kodiak: Describe EUD UTMI path
 using child node
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
 <20260811213610.2956147-9-elson.serrao@oss.qualcomm.com>
 <906db71e-8f2d-4ab8-856d-915ff9dfef77@oss.qualcomm.com>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <906db71e-8f2d-4ab8-856d-915ff9dfef77@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: R5rjqmpLuwbmXydU4VGMkwEkJyjGrS7R
X-Proofpoint-GUID: R5rjqmpLuwbmXydU4VGMkwEkJyjGrS7R
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDAyNiBTYWx0ZWRfX7VHY0u31W0yY
 h7EocMKQZXwF7EoLASdRUHfnIHVrbjmZWS+Nn0lOVd5RBqkkMuUrq1F7TlZS72MEsLv2H+GhDx2
 Lr4Oe74WKoyDobS8O/PiH/R+EjPwVGA=
X-Authority-Analysis: v=2.4 cv=TqPWQjXh c=1 sm=1 tr=0 ts=6a8d0be9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=uHxescsG3rBdxcXwcPaeSg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=oarc27XjrnPoJnDktLYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDAyNiBTYWx0ZWRfX5p3jFPDbB025
 MLtmAO8NE+Zw7nE/akZylbHMz3ny1Dzp4zllcsBqDkYFOhFL+6kjnZIPOJq/5Ez1uspUu7KnETy
 GVGvOtoiOEjyNGGVxQ/EASmQQ97L1lOSSo3cphAfUl9xyt4ie1CbDvsd0y8XIjaL6IRPn6muENu
 TCBU0wHnIfJwaEkwJSqexz88/oc79xcu2pbA7SHNtuFn9We5bSIlbrchnPNPlXYAzM1kN13o6Sj
 4Yt4VSvW9AdZ6cp/RuU6DvrK2NIlpJW/B1j5bFH2cW/rd5tYlVd1jbRDLF1NGy/1jvn/7K86k4Y
 mTUz7RDB08+mYcF5BbV1HX8dLGeEA4hF4i/wqhD9rGAe9O6R7I/SrneVwyPVwrvjVNq5FetHccf
 deTygdnJceckCYRubAzi1/0zR5uRU8ARmssxhrNuXr8Ge7Zp3fYOe/hWeZ3mqO0ThCU4WiFdwF8
 fg+L3OU8eNmzEYpzfzg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250026



On 8/24/2026 6:48 AM, Konrad Dybcio wrote:
> On 8/11/26 11:36 PM, Elson Serrao wrote:
>> The existing EUD description uses a legacy single-path representation
>> that assumes uniform UTMI routing. This was sufficient for minimal
>> configurations where the USB port operated only in device mode and role
>> switching was not considered.
> 
> [...]
> 
>> +				ports {
>> +					#address-cells = <1>;
>> +					#size-cells = <0>;
>> +
>> +					port@0 {
>> +						reg = <0>;
>> +						eud_usb: endpoint {
>> +							remote-endpoint = <&usb_1_dwc3_hs>;
> 
> This change alone will trip "connection is not bi-directional" warnings,
> as board DTs override that endpoint already
> 
Patch 8 on its own would indeed trigger the "connection is not
bi-directional" warnings. Patch 9 updates the corresponding
board-level endpoint overrides and resolves those warnings.
 
Would you prefer that I squash patch 9 into patch 8 so that the
graph remains valid within a single patch? Alternatively, we could
move the endpoint assignment into the board DTS. However, since the
EUD-to-controller mapping is on-SoC rather than board-specific, keeping
it in the SoC DTSI appears to be the more appropriate placement.
> 
>> +						};
>> +					};
>> +
>> +					port@1 {
>> +						reg = <1>;
>> +						eud_con: endpoint {
> 
> Let's keep an \n between the last property and the following subnodes
> (like you did in the below hunk)
> 
Ack

Thanks
Elson

> 
>> +						};
>>  					};
>>  				};
>>  			};
>> @@ -4989,6 +4995,7 @@ port@0 {
>>  					reg = <0>;
>>  
>>  					usb_1_dwc3_hs: endpoint {
>> +						remote-endpoint = <&eud_usb>;
>>  					};
>>  				};
>>  
