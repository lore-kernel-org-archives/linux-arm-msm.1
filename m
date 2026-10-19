Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C0950F131
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 14:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419001; cv=none; b=aALD0J/vUSDnSDphNIqDzbUVADVN8ZV8RsVH1ZaxvompjsLp/gKYcZ0DQhd3pxbkzJ7bFM/FMZdD1bDA8d8UJC3V1ej18dny9TNXogicWnKiIo/0BDLs1alJ0FuhBx8BA/rDw6rK3PcmsPGakbSzb8GElE5bIuS+n9CxeifgmNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419001; c=relaxed/simple;
	bh=2zRswY1kMWQs0gXfYi4Jh01yqYcUt3kjlN5/njNXAJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XqPl4dhgDMqZerIqioLWOOocYz2vrXvukg8SRCaI3KI88MYInd++o9tZUaHMoZdW/SaEzdO4IulX2Qg42UT0AVdaYe4xWbECUb4oQ+h7PCb7Ix8H+UDxca8cn0uCmShAkQpXaIojDfzvT/LSCcfkVXrpD5X5V9cLNRUM7SVRcx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gv4xxKaj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ay/qlqwq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gv4xxKaj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ay/qlqwq"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0Bbm3486038
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 14:09:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ouV6+Wxc1injxeExVghh4cJm0g67UbarNcdMufji7eI=; b=Gv4xxKaj8Cit20k/
	57e2jFRI5tvJOAlEdVycQAm7aD75a6O52Om3wlOvEffPEIz+R0cn123su6ldFroY
	uRCx/1kEWkanakST5W+jF3LNsjT6A4HJTgNuFzwZHm9tHl0YpqhZARp7YiWs7Dvr
	TXqdcIfDJwEAq+Yy9MF+4Pn9WyIU1y4JkwdQ+J/4MMz+yMFLx31NdZp0pcSi70fc
	pcSz3jny5qvDcEVP+/z4ILWaxN4gCuNTASCuxVdXLB2XBz5k/Ow+fj6MuWuxiUFw
	iqQJHvVlIJTLfWaju/LyZAyvF4K2GkUmGJvcoIrwdjEJsTGer+dMo+bA1JWO1jT8
	eSZsvA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf48hhb5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 14:09:58 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e95f8543c9so18255525ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 07:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792418997; x=1793023797; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ouV6+Wxc1injxeExVghh4cJm0g67UbarNcdMufji7eI=;
        b=Ay/qlqwqq05so18r0Zrtc4BzFlB2Z/1uKxSBx6VyXhwjOVfRK9IV8aoDAv6zehF2vT
         Xa/tXBSGo4IUz65aAvhew006DHycZnvHij6rnvxO5iIdAhCuTz6li8klXDGh9z2JoJpw
         qnRdgC/CEPlHGvIAyDXfmPjeo/e5MRiqWml6kz2wW8IldmP31964r0JZSvUXkJg/9UoA
         AYXDjk++DkYgGNAksuoamSxKoTUFzNtIHOG0OGJ9RdezgFbxXMfufrD7ikv7egsCDrU9
         uJMucWYFJPnhz4A/iDpzsfvQb2dTPO5EN465tXQd9zXsOA6v1+PuopDD0s2gMtc4KThv
         pyyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792418997; x=1793023797;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ouV6+Wxc1injxeExVghh4cJm0g67UbarNcdMufji7eI=;
        b=xgif/DGo8AxLixzZKGQkQ6pCQMzZZ324REbuqjmFJyZVMtibD0SBYwdNxWybUM546C
         4AoVJN1egWVlWaGo3G88uJU1cZrkL4Q2A/6NZ09OBgOwnsOMIAlpK6voyK1Qxy7aJNgj
         6VRbbAgdRXjYKHLWa6VNwl2AswmgKnuP0P5pBLqvslXq/tWaq3olZUvs2Ovfl57UB/Zi
         giDLw45uUvwkWoHPSExPGiUKbWgmLDt0h/hoh2tZk30OMJ1y/iSSy9a9QggcHn11w6+w
         JfxVNfuWwO55zlNa6GU0eqFqj7qbqsm+Nd8+rjjx6BBye5nlbUCXmQz0vL3Co+ErqhGn
         KHcg==
X-Forwarded-Encrypted: i=1; AKwUvBxlsJTzFpbfaImtytr0dyFKn1Q5/pmM67641dD5gOXR/p7xSR46OW4HMaMaY+yFdDKORvkHEjCUVXoSRfEm@vger.kernel.org
X-Gm-Message-State: AFq9FYLIxv9tD5zvf5RZedF8xcsnAA7OiLjcSvcTywuuF6vEOIEQG0Q0
	fM/wffkp4mt8sAHac+O5wE6kYfcjI8zsdFk3Tip/nKHCSAMkgug7jG+Jf2eynb4AytFDKJXZXXU
	Eak9mIuRV891bjZMm2t2icc4YgkFtpp9e/qOXXaU4z/um4vYhblQzsWTZWjOqMILGGfqA
X-Gm-Gg: AYBFou0h9G5/DUmTq2SRPsiG8+h7cEUDCwg8jg6XcaF8FsHBkdmTqEs/vOpx62pmBBM
	75n45mlfKnVdgku6GXrdBcukwe4/9Dv6IF2ysvJbOeL5ZlFVs9ksX5i5yv954sgfTbHw5z2ldwc
	YV8S4HCbFxk5+hLb7I6yZzr/5jmuqsPSXP6hwBVWs6Ur+H3Hb25gO21x2kOuDoJRwyJaBvKfv9i
	pYhnW8PdZuKZZ9jLHlBEa6PyMZJGBdWTnBkMHlj9R5YzXRbrB5lCXbRSWPzdnKgGtv/bYGLCH3J
	q5Mize6RrYJ+bpVtbUrpk485Ke04QvdQKAuQ+lOGhFdOv1wMd9wdrX9GwxtMw1ldfYXsgnPQQyk
	igVTnDmY02lC8JoY7eOiMolezEmhz
X-Received: by 2002:a17:902:f54a:b0:2df:35f1:8771 with SMTP id d9443c01a7336-2e9a6c24bccmr68072255ad.54.1792418997291;
        Mon, 19 Oct 2026 07:09:57 -0700 (PDT)
X-Received: by 2002:a17:902:f54a:b0:2df:35f1:8771 with SMTP id d9443c01a7336-2e9a6c24bccmr68071855ad.54.1792418996622;
        Mon, 19 Oct 2026 07:09:56 -0700 (PDT)
Received: from [192.168.1.9] ([106.222.233.74])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea151e1b09sm1459455ad.69.2026.10.19.07.09.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:09:55 -0700 (PDT)
Message-ID: <84ec68fa-358d-4339-aefd-ed100a4b7da5@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 19:39:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: thermal: thermal-zones: add
 hardware-binning trip properties
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap
 <rdunlap@infradead.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>
References: <20261002-thermal_bin-v1-0-5a29be7e8ec5@oss.qualcomm.com>
 <20261002-thermal_bin-v1-1-5a29be7e8ec5@oss.qualcomm.com>
 <20261013-jolly-abiding-wolf-bab43e@quoll>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <20261013-jolly-abiding-wolf-bab43e@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1NiBTYWx0ZWRfXxk3EMov6xZqE
 NhvvyfkhG8vmunPJ8dkItIJrNOMvghKi15uPOwNR8kaXBFgM79JiXB5EhPx7ghqFQ4jr5BEBdiH
 PUUywzQG+l2ibLin1sZXNLk+Hl+zONo652eOZe2wieSCj13B1sk/WEvVVJ2V4F9WUAkOklYhNBs
 C4rUybm7P+2B68SbHDqe16+Y7TFK57ZorFG8lEPdSRHYe56nVbqN44s9mr46JSXO6xr7egyU3Do
 tAUXowj47mGdm4wiOmEsP/SYjTn2V1rl6+u1vRhJSqf7tHb+sdVU6iAqxzWEUdMk/Fh279Jx/Kn
 6PnLg6YJZupHnG59nWjOBWr5ktvrsh5pG4w5yw/H7mVj+H71HrbIYDOpaTKTIx18W/otrrTY8KV
 b5T1PBK6godk3jHG7LfW9K8kWVtpJyohVTMs7zTXfu/YPzZpl2BKoUCBu9KIJqwyy0dCXIhxe9K
 EvPgRw6FGju1jUTX+Mw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1NiBTYWx0ZWRfX5dtylgtF19+4
 rf6TNAh9g3nDs3Fq0jhVO//JRZzaUXU6dUudoJwqpf1VzK60HwhvVIa/0l2lr1nMa9D4nbKplfR
 ejgzwm9lhwpf0cgxXnMR1MOeY7JGse4=
X-Proofpoint-ORIG-GUID: LforJlRTG4Jcpwjg3Z16-dm9iJA9CuFM
X-Authority-Analysis: v=2.4 cv=Qr/LTlyd c=1 sm=1 tr=0 ts=6ad624b6 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=A3JsiXT2jxe2NWqPQ1aCbg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=-zH7FtNjIyeSShpWrKEA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: LforJlRTG4Jcpwjg3Z16-dm9iJA9CuFM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190056



On 10/13/2026 11:54 AM, Krzysztof Kozlowski wrote:
> On Fri, Oct 02, 2026 at 04:16:56PM +0530, Gaurav Kohli wrote:
>> From: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
>>
>> Differences in SoC packaging can be used to provide multiple SoC SKUs at
>> different thermal and performance characteristics. The underlying SoC
>> remains the same except for how much heat the packaging can dissipate,
>> thereby influencing the critical trip point at which an SoC SKU needs to
>> be throttled. This SKU-specific data is typically burned into fuses
>> during manufacturing and can be read back at runtime.
>>
>> Add two optional trip-point properties to describe this:
>>
>>    - 'temperature-bin': an array of per-bin trip temperatures, used
>>      instead of 'temperature' when the trip depends on the hardware
>>      revision encoded in fuses.
>>
>>    - 'thermal-hw-bin': one or more bitmask groups describing the hardware
>>      revisions for which a trip point is valid, modeled on the
>>      'opp-supported-hw' property of the OPP framework.
>>
>> Signed-off-by: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/thermal/thermal-zones.yaml | 53 +++++++++++++++++++++-
>>   1 file changed, 52 insertions(+), 1 deletion(-)
> 
> 10 days was enough for replies to feedback, so dropping from patchwork.

Hi Krzysztof,

Apologies for the delayed response. I was away on leave.
Working through the Sashiko comments and will post a v2 addressing
them.

> 
> Best regards,
> Krzysztof

