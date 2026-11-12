Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794476023;
	b=NJMJ4cq9132nYd6kqFniL7rr5njcix9p9kNb25uk8id3k9uxM1OlhHo5cQyGm16HEbUE
	 6Kwwe4sx58QBdAAzMpIn6nrZ4HQxYbTBwilie+f8DyF/Ts+kWsv153G0TUKbqUvEDRdur
	 QgUcbbmwgqfFHRALQLAt+k+hS4YOxQo/zLv+q9sAC7GZ+a/yMthuFNjkQ2z6Ya4wP55Ry
	 BHV7qJL6hAtB/87WqURxJ4aFFe9hItrqORvqUQ+kF1kE/e+bQWYaYZQ70igplphNbFPpT
	 ZDXPWJsiH0SPz8BXhAH9hAbcNz20wCpp4FCDWjX8FdiQlG3+P85SdXXycGS1VZR4F0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794476023;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iCHXDwClae4oFDnyJoawnDwBwVWh3VIIZGhH+xwjJ3k=;
	b=udz7yEVTk3KahnVnkeZDLX+qFxvMNkbgdDCUwwKCA+eGDkmDBVBcO6zHPHmeGhouhY+A
	 +MpyUnZtphDUS6zrMrZDXQIjTP6spiWA7PXFbPCUc0TrtS0TrW8hZSac03Wq7ADAJQrhv
	 Ad3y+O2jb6E5zpzJyj2NySGrdpMbKn+KgtQqadb2nGvhRrNtKb534c5gyW8cJWZ5NVc73
	 yf+gqEsallmc9Nx0ESq7qrjvIJltP8oKMI6uBpproGiveAZDW/MEgWRVeSpifeYHyt7NW
	 luqxDHiVzW6q13XX5g+oTzAZEMs67XkYmrQ5KSGKV468Pd47nvxsc6M7ge55+2iSrlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=osA+UM6B;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VZuxsT+7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FEE606A883
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 09:33:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84FEE606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=osA+UM6B;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VZuxsT+7
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC9Jkaj903659
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 09:33:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iCHXDwClae4oFDnyJoawnDwBwVWh3VIIZGhH+xwjJ3k=; b=osA+UM6BNguP8NUv
	I8hEASmlG4AHeys1KN0uBPHtIozTyZ4v6JhfNz8j7En4XqgiHU4VCoAhMUOFZBhp
	k2JfaVlJESvYgibKklGA+m7Gp5WYx852Nw765KdYrL/Id34tRM6ksKmXfvcqdN1p
	ZOOH86s8+ATr7Jwdos+9GXpABc7Y2iSI6TP77iJ6UCHmAVR/rIjKAuxYHNllre+T
	XVbSGAvwyoWC9WQb5v6wY5rUcbZ7j5QOuBnOkuN8CtROK7DcYyL7x3TalUK5l2AT
	taof6C9zPMOWcHiEJPkM9U4fsLDc9DwYp+Wq9Hlc6JejTHNg64ow7e2DE9pEcD0Y
	Tlg54w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvt1uby9v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 09:33:42 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8b8cef34b43so5385927b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 01:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794476022; x=1795080822; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iCHXDwClae4oFDnyJoawnDwBwVWh3VIIZGhH+xwjJ3k=;
        b=VZuxsT+7DlIg/eOFppBPWMKG9i6N1yJmr3iIjOvI9tdxl+bVMI18ay3EHiD2y4HXAU
         cnT5yPH1Xq4dU98CVB/62oN9ASIxz3cyKiz7AeggxYDZmQfEDyjBQ3mzQoZg+RkwyvZO
         3e6FgpUKgRHTYsO+UoDck8mu4vsePzOtN70joXsOmHq8bVNya5HU2AWXuZs1IIRRXw00
         m8rSHrODCSqJjRAasGklsry7wtgsK80pQ1WF9DSSUOBPkSBRvnJKmK/8SshXxWJuJMeA
         LxoWe/1HhxbmU0ZxsmhDPaTfSC/cXpW88cKWCjQE2xTte1Ax4HUUNgUGqP5rWE+hEXzb
         KRXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794476022; x=1795080822;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iCHXDwClae4oFDnyJoawnDwBwVWh3VIIZGhH+xwjJ3k=;
        b=Av8+vvWYYm3xvqmvaLQ1d7WlS/L3LhnOvpmGAMyocvBohIQ+NC0eImAPI4ptfF8TiJ
         lKmGlfOR0PQC6Zui/Uml2uM9FNnxzIr2CMhsz3f8BfbfLnaPlPkIS71rXaOkZOQNWse8
         o/fBVA/QHz/OpOjrj7qSkwS0yU81GN/wSiI84rzjB6pe1ZJCWzj5xYopZ90j9lnlJPlu
         dlc+gyv+sJyhuUHEbQmTUAt/6b79x+9nS1fYqil4tTK8/kB+y45doYtdOKwMBXjs968U
         IPG06i2cwNyy388i/3G7Guy/mz/i/Z16v6LwK/DsM+nMKD0tMe0fF8uiP6H5zNNlT9q4
         /+kA==
X-Forwarded-Encrypted: i=1; AL+hErHQf9PQ4o/2TgwseMWcI1rKmn3Myd6F9aE7bY4f88udRCyisXkBDAhVGQKoVBDr8iGK0+COdCD6yfeS1wNj@vger.kernel.org
X-Gm-Message-State: APuU4Z8HZIaZfHZFEXuGwMepBAxOhYSP4pB+i4Nv4i+zU7Ahn4eElzE3
	0Q6J5sCy2I8BMBD4W1jPlxXrMWC5DNYziQ1IkE9jn60g+a/vJM+EAc+xNuIpUGuVlVSfuVUF2DU
	HSETj29ETlrVEki+5M08WI3Yc7S+y18566XK76Fpobnb4bQssrlgHrRff1E0Scqm7ESe7
X-Gm-Gg: AYBFou3+V6gGOTfhB7aeP8v9giTTg0vCeNFhRGTUYVSFyjthuZY68FMOMR+/H1GkSVc
	7tntBC+SXiucwJ0ihG22D49adCsSiDOh4IOTNARfkeTi3+xDvXAVhEdwIBD+l7IhLJMW16xTmn5
	nMp/e8AJmQOXkH76gaLpBcMLFgqJyqRp0FpyVTIVqvS8YkCH2tJtQYbnCxMuKL+RE1mXxcKjUAD
	fMs9b9ndPxRQ9l12DRJnRslOMU5Kg+v3zuObzQ5h2bxQFwBFNrQokmC/edeswy0kNzU7X1ALkqc
	N3WvEinq10UuHSp6wk90V2N4Oq/IxY1L5FWgQFK4SF6v7jOa0jKzzCHRSqppG5yp8TuX4bvOm/S
	BbT2l4s/4uXsfaV9HOgbrMjcU+yUq4sL/X3pSIkH2oZguVEg09OgauV7BG8pnf+9ybxu7LPNpKS
	L/
X-Received: by 2002:a05:6a00:1f14:b0:899:13ee:1bd7 with SMTP id d2e1a72fcca58-8bc1c884c38mr5109968b3a.35.1794476021916;
        Thu, 12 Nov 2026 01:33:41 -0800 (PST)
X-Received: by 2002:a05:6a00:1f14:b0:899:13ee:1bd7 with SMTP id d2e1a72fcca58-8bc1c884c38mr5109940b3a.35.1794476021449;
        Thu, 12 Nov 2026 01:33:41 -0800 (PST)
Received: from [10.217.216.70] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaae3e9dasm3224610b3a.34.2026.11.12.01.33.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 01:33:41 -0800 (PST)
Message-ID: <8d449b0f-72e6-4fa2-b10a-0e034e8bdfb0@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 15:03:34 +0530
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
Subject: Re: [PATCH v2 06/10] arm64: dts: qcom: lemans: Add support for TSCSS
 node
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
 <20261108-tscss-v2-6-d5f575010427@oss.qualcomm.com>
 <20261109-enigmatic-solid-sambar-ada2bd@quoll>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20261109-enigmatic-solid-sambar-ada2bd@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzNyBTYWx0ZWRfX1fluyCxPoKdV
 6h5v5KVLy72USg4ahy+JqSFC3fLH9L9FN0uiXWIqJwjw25RVyIW4mC1UpleDbq9ymw3k9CjUSk1
 D+Pp95nUn9kXBP1XtHokILK6PnXW3/A=
X-Proofpoint-GUID: 8KW0TycsLWN0amy4TrHLgjtqkY9OvBm1
X-Proofpoint-ORIG-GUID: 8KW0TycsLWN0amy4TrHLgjtqkY9OvBm1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzNyBTYWx0ZWRfXw+1M3EtXbuw9
 h1ntMNt54FZOKlZr9LbeLZmMje9SC7aVYdMNxfaCrvYcCpeaeyIMdAqSkgYZvhebr7xrHafif15
 Pip0C3s1FPEq+RmXtyy8Va85KZU9qbfsnsOY5NZqzKbjR/PHF4MCQamlbxTOWQZprzEgdCNmFAg
 20MdZwtgY/dKtGcl1rYEND2IRuMmEjttOuKZH0SPTHBGq70Somk+5ak94aRBQaerXKPdd/XoMCY
 yxHK8GAER471qm9lctAZl3vynrzOrtpi5xKEQKb3/BUl2GHWMgthznZMkD6zzaOn6HOSqQkGS+s
 G1T6Nxk08ZBmjIj3Qsv0Fi77gkVbzE+2P28Grz/tSC2avuVUCcrj9t3+jprrnqTYaMRTU4inZ8w
 tthEFnl37ORcXXr9ImrdCuV3XEleEPW+/MydxNTg7qr7NAnY3sprxK++BGEk07WwSNQgNgQVJhX
 I6SvY4xrZjjGbyLcdkw==
X-Authority-Analysis: v=2.4 cv=LvcHWXdc c=1 sm=1 tr=0 ts=6af587f6 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ClY4ILnnmydcLe65dWgA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120037



On 09-11-2026 06:22 pm, Krzysztof Kozlowski wrote:
> On Sun, Nov 08, 2026 at 06:48:27PM +0530, Imran Shaik wrote:
>> Add Timestamp Counter Subsystem (TSCSS) node support on Qualcomm Lemans
>> SoCs.
>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/lemans.dtsi | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
>> index 1fdb72fa5518..4c76c820cacb 100644
>> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
>> @@ -3022,6 +3022,18 @@ pcie1_phy: phy@1c14000 {
>>   			status = "disabled";
>>   		};
>>   
>> +		ptp@1c80000 {
>> +			compatible = "qcom,sa8775p-tscss";
>> +			reg = <0x0 0x01c80000 0x0 0x2000>;
> 
> Where is the rest of PTP devices? Your binding clearly said there are
> PTP with one and with two address spaces.
> 

As updated in the bindings patch1, will add the ETU reg also by default
for all the SoCs, and will take care of constraints handling based on
the "qcom,etu-slice" property.

Thanks,
Imran
