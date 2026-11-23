Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795419008;
	b=2g5zrWVV84JN2kJZqxkYrgqzox7L4yzvoR29kGriIHbu37U586IXEApym+PvZmWraZ5o
	 5CHO/YJkz3ix7DnkoTdH8Er9H4/+4t5t1UoTHx5gr0r815fHw6YKD1iIqpHLeD0SiFis2
	 cPpJwahnh5C6h0Oa8SXKVBLywkuzKlA7a8NQOc5cldRAeSRsjCmXHeiisvIW3MxOLNCLR
	 MXd3kHyMUoodx96Eu9U5myWhr1+bncZd25rAr4oG1UkfQXET2oPlnh8ZRjQsEufFCg/Vg
	 uPxOx3nH7nBtotuP06fH6A28DKULlEmxQtcjLoi9wdiDO5seZCPBUig4VrmNHw0kEgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795419008;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=b5I6At9NriXkP83BXcdzV0aMffcpFfR8HrpU3MU+fX8=;
	b=AO9Uf0PzrZgbZ6x8+BydwOq0/5iED5QglGR4lMut9WvjbgRd3yxA4Nf2bSiatjbCIngv
	 YvjnWzAGfcHDnNUKIOPH9gX6oAJNt2EpWb48WvQR/aMS7UXraF0kyTSt9XFkorOvS4cyS
	 UFAzXyygNq7bO+yDCU3d6HUG1/pvjtHjM020wOzHLVo2Bu2y11VWc51xoo7XA32+UicgG
	 0IVntUkTiuGx21mXkdBevg2fRQA6tk71zDL4YW02n7cH7XPRwh1NBD3uQCUX/m7Hm3pNn
	 eUYEHmUb5D2ZLmuFo5ugNDrUS/l5RvAn3Rjcu4QHzmWKbzT/nCpqrOmOWQzDfDtyWfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="a7h4/pJF";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LT3vQOTs;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186B8606A31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 07:30:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 186B8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a7h4/pJF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LT3vQOTs
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN6PNlk3712620
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 07:30:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b5I6At9NriXkP83BXcdzV0aMffcpFfR8HrpU3MU+fX8=; b=a7h4/pJF8LvXYqPV
	TQ4uTvPsUORRjlBKTJBmgio1fmW4wvH+wzCUlfEmt8m5p8ZY/3GcNpupyxrEeqiN
	6OnuMVymQy/SL+IkJcSQWDVbq3JW6kmTnPF6xCmF6oB/rU3h9z3az0BfqFI0nFWa
	XPDwm5NwDKIAmSJqaxjzq345aSN3EOwV4h6jWTCBcVkadqrjdGzV89XL5WyI7Bs5
	BYPCvMT1Vq8LlYvJOrpzzrZZpIxOmyiGIPHhZI61Xznsp7/JhNzaHK9oC/jq7Nm9
	ud4Bk6SpYJ2lI/3ay5ko/MNeTZRrMsCrWb1TKhxK2bbNF1pdd55/93PLNYrZT4fI
	AEb38w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g7407qg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 07:30:05 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2f022026e60so32578945ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 23:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795419005; x=1796023805; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b5I6At9NriXkP83BXcdzV0aMffcpFfR8HrpU3MU+fX8=;
        b=LT3vQOTsXVne/0Knk7GBE+t4W2BMegIMwmZ+eceSyJpWTfEDFRxVjOensMrNTRfcFq
         t10t9AGquyjNpVt74Lot/hfKT6tz4QLYYxUPix7vkKwyvoQkdznlhbF1JkrDlj7V03Q1
         rZA1m38tSnWhYNSMj3EVge2ydGycoNdb8dshtRcMXMV1MTLVjyxRDkaruTd8jWNHbSCz
         R2CEllOxcGrcLNW4+0Z1zpbAAzi+ZtWDl2PW3vbHfMzvB3tpvjwR+HTv/4q/v6WypLxG
         QjbKYu6MxUBHGWVOy4tdagmvumM/AAsC6Z9ziBHh16bdzXClGuYu8gByaEHWtmv+i8MQ
         YO3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795419005; x=1796023805;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b5I6At9NriXkP83BXcdzV0aMffcpFfR8HrpU3MU+fX8=;
        b=zMBFv003TsYFvNFRlzFH+pieawPIS/VhT6aiK7D8u3CnAveiF6MFO4QUEiKmxWn0Cx
         xU+c7M7oPKSjzUVDcoU+Z/mOU6HXQ19+iSzm44Or1TPP04jEscAtSQA7ru6GR3J0xMcT
         1fG/GmQ0e0bfQMbzbhbZf8S2tde7/H/7bjiwq2GXW/r5fhPAQfKZ4ih4s9JlDniz7dYa
         jzoD4VHnOfbkX9S9tzFsPgsgsjLYqTnpZG7PfMU9AKh2ut6/7qhCL4HgmvJ1fblpfNse
         Ap4wk3wpOPXth6S0rBokU1+vA50UlyjONlRK7JsylxlGYzxJn7uRUz/UkTSmZAVKl27j
         29UA==
X-Forwarded-Encrypted: i=1; AL+hErGpeVGUYlDoNEcA85MYkEeiKqcJHxNo9/7920Q1tEHG+X5UVwlUEglDAZHWi1LBprVx4syjEWnc7bonVir8@vger.kernel.org
X-Gm-Message-State: APuU4Z/JOY6BthmP+nVh1/SC3UyIO76Jmz/n+Nr/DRwfDCRvgFVoSKUz
	ab4Is6uJCLw7iWaoKKxr9buZke1NNKtujPpKfK8taXOQBYEV2v6SwsMlESKoojKqiq3rJFEoMHB
	L/4zincNZUVOrizAOGvXUDCIlmuxoNpVyhddfCRJB0q7SACEkwQi7lPeY+wCVwMBpe8hMEjs/sk
	CF
X-Gm-Gg: AZFdTZdjZXCWllq949VJOYZegvveKjN6EsBBliQULeFbY/h4Jfa7WZzfUU4xWC9jcrR
	92BZ965Hws3gWr4EefmSPx598Gkb0AgcdWe3+5jKfMm17BzLWDEBm++74ZzOhkeCHj9w0j7cl/8
	C1FC4R5TxvZs1OtyJDCl4Axit3XnnBIq1ayQSR6sOjhRfldk61R0lTff0/wEevmEwn/WIO63p19
	cgJoGte4VHlGj8f0mr18zfewPo1et/NvLbDjPjbcj12sKG7cEeyA3laka+cGaATGR0MYXY9Wbkr
	+CVFcDRnIQ8pzYbnqxyTLba7Oyx1HAoY3HJKQNyjcUKGvI9f6s9Ja61yl0l7btp/lLiHm1u2B4a
	1kUohzh1nEZtZ8OqbbOE9nmdeYwijpLF72+7XuLnAvS6Um8usz9xT+I/Tg7AH1TbwY2IUUMZSao
	RwYss=
X-Received: by 2002:a17:902:d492:b0:2f0:87fa:e3e6 with SMTP id d9443c01a7336-2f087fae858mr25401875ad.36.1795419004470;
        Sun, 22 Nov 2026 23:30:04 -0800 (PST)
X-Received: by 2002:a17:902:d492:b0:2f0:87fa:e3e6 with SMTP id d9443c01a7336-2f087fae858mr25401665ad.36.1795419004002;
        Sun, 22 Nov 2026 23:30:04 -0800 (PST)
Received: from [10.219.57.104] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0ea6a8sm47354925ad.36.2026.11.22.23.30.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 23:30:03 -0800 (PST)
Message-ID: <01e967c7-3c0a-4262-b911-5987d6fb877e@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 12:59:58 +0530
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
Subject: Re: [PATCH] arm64: dts: qcom: maili: Add memory-region for audio PD
To: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20261123-maili-audio-v1-1-7dc0152eb70f@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20261123-maili-audio-v1-1-7dc0152eb70f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OBIvL2PsKset0qthqnr0subTASg9pnso
X-Proofpoint-ORIG-GUID: OBIvL2PsKset0qthqnr0subTASg9pnso
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyOSBTYWx0ZWRfX+IRd/+zliW0e
 w13QEi+dtNal0cf5BFKn5lqqfbN5t7vCmoaqZZyw0zel+SA7wa31Pw/Q5Pfd3y6pEr70oLpiCqD
 Pc9t3AI7fVENfVr9cjer03/0JhZchEM=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b03eb7d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=u-a0JlRQecB2z73C0TQA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyOSBTYWx0ZWRfX8cbKh3C095pP
 to1b7QBhWjDZPfkWMuk7/ARGd054ARSR4BK0iQqAih9rWuXhvkESB7BLjrF7z/ch0r178ehSv7Q
 9nR1aDCF5Zx/wrpYk9HDbJxnEkESphc2PIBdzmx8JRGGy5aKAMHVhODFC1P2eYpa3fyMWy2b9lR
 q6bmZX2VKq6d6cbxBMcRw5kNBRiytHhQTM6bBbzn02GxoWi0stTPjvu8m6VKmcRxZ17YTYXHd7n
 Cr7uNu9eHApWf/RulzvK1rY49fFQMKyqhaqTKZbOySSvIotK5eKjz2MnkPNxvXsz/UPPuldznXv
 n1qBCaznwEssy+kqGS3LT9mNj6H3rqM6vYnI1Z1478gcdcOOwaRo8NEZWERl80F5nM4uTS8NOI1
 MZqIdIJDNaomzXZA7FqdZxozvwZpt8ZaGavZTUwfmop+OFPcLp75KoOfMII1kz2jf3c1murM2vE
 eLC+TrIcxMcWNJiMqEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230029

On 23-11-2026 11:13, Vinayak Katoch wrote:
> Reserve memory region for audio PD dynamic loading and remote heap
> requirements. Add the required VMID list for memory ownership
> transfers.
> 
> Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/maili.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
