Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792661679;
	b=ACLuH/+a639WOT06FDL0fuf0LwyJYNg+VOqvCYVrYXbQ78bmHIEbagJKAL8itHurlCMp
	 cxKLhT45lhoZaqYeMqVma8X+pQbxpI5N3GejwH/gpaZVn6/vuuJ0+sfJTBYi2c4OaBa8R
	 SrcSCaJ+y0Ajg4+wiufR/lpwFSEGj0+zSFNRQk0CdUtxKYa9k13jBOYwyn1xQAVqNvovG
	 abdxa2jQBTnpbYAvrr1dTYjWpUsuuwp40Wc5hGQkxI5MYFTy7Tkngj+psEBTbiYhcqJqc
	 XBUkI2Z35EYhCuXHL+0yLP4xCpBYmk7FTSkuURDGm5NZCU+KQZkXgO4n3TukKy99Syw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661679;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1Rj1qoidH8EWT/n0srs42IuX9uVyDVj0QwR1LQZqHvM=;
	b=P4u9rSEWgMld8UVlls0wDY5rfvj5XcDcsVWA/hp10356/WxgzSKj1Z1i5FcGY4MVlgPW
	 LrFKHxNmK6jr5sWtw9zCLqxAyfhCSWu/EtfuqgR0HHeF85i9kJWZTkrgDaofzDouYILoj
	 p2JEcck99cl86VGwGXwguK3U0Jbv9FZVfjwHJQBkrjvajNBiqYMc9hcC+IX+hwqWp4AUh
	 ugf/foWG3Se3YA7Njtk5zrclAzx8Erdi/insecqQy0kUyCZyg+GJhjD/60Tlg1fgUibtw
	 5I09779lXHYYkvJYP5IH7WbAXxMPLb8w9T5GH4P00U2bFNR7VhWJfoJMpRPpRnvvr0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PwrcdF+D;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MgU08mWf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4966E606A319
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:34:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4966E606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PwrcdF+D;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MgU08mWf
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M761Mp3039000
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:34:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Rj1qoidH8EWT/n0srs42IuX9uVyDVj0QwR1LQZqHvM=; b=PwrcdF+DzUJmRnde
	hI8F1YEjOk3dDfEL5mPGuYlg5y0weZGfzUQvhEGuLehfcUPQnezsoOltce4qCb4a
	bmPBXs1OV01hZAOhn4bcnQWyIoJghdPK9LhVpFL5LaJGTb37Fm3u0Xlx2UnwiDXK
	jsl9tPr5zVPw8tidZPUcLjYo3IInZ/qeMxL2AOkpLF6m+xmqOrz+9gM58ZkNOqH6
	Ggkbama+CbUkq5ipxnbhKEBCjpb9Px3G45hfg7+A0eDpqgl6khjQCo6BC9sW6tPS
	6+wo3Bkk0dpz/4EzjVlGUpkCGhHZrqmqE4tPEJjtwGY+0fxaeDeEwDK0H7u4IlZB
	H721Gg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93asntc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:34:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93edac58b24so44024185a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792661672; x=1793266472; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Rj1qoidH8EWT/n0srs42IuX9uVyDVj0QwR1LQZqHvM=;
        b=MgU08mWf86/eCmVEtWfCW81VxhUZA0IAFd+mldO2lpHBg7Rx0kyTwb76uZCi8BLjmQ
         BciNCxC6mVBsjtW65+k01x1OM0cI7ZEF26ibQxsM6Rl9qZNZgsTBIkDi/qJ05yBpy3nO
         y01b4QLbSaLBmFqplinVJLTEixRXK0M8nFA84+zNgA8F+/bVuTiFfchDBwcoDzZefkGQ
         XnIx9YZujEc4aAwtRvzH6GiWAFLmgiKL/x5I6ZkwKwfk68cE4gikbkdDEYpMTxcrEOQ5
         1EgkwDgSNqePUK4kEYYv3j7cEYz7K2PeBw5W5SYjsvJ860T3wZllodb8xI7/93pwpRLP
         FiMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792661672; x=1793266472;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Rj1qoidH8EWT/n0srs42IuX9uVyDVj0QwR1LQZqHvM=;
        b=LBQ2wTZGtcaQ1xNshzh3ZBmWJvt4DLOhSCg3mUki5LZ7cqQq7+5pLhyyuHbBpzgHHg
         2Kb8/yFWhUWdSsmdvBy7AR4vhcRierXxx2IXckGMkU8p2ZkVx3CEV9fMQY9nf2mI+Zsf
         G/tbdI4sf6uJ56sZj1ERdgbKBTKZiTCY0PCt+TYpAjyWesW+8ZgJE+8cKOQeA5F1+FX3
         mqH3oj+DtEQGPt/KcIGCZY7s0qdXac0l+6RteuJJqUL51kaXH7BqbnLnmlvhvnJl/4l8
         HtXVxOM/CCTNUG1mo6+RNnuBZbHWRQeUqyOwyPereaQ0mClspXTGTXvHyb54VTlffVtS
         owYg==
X-Forwarded-Encrypted: i=1; AKwUvBxSGL4g8SU+9uT26ZEhcqKWOE/uqKGBKM9SivBUSeHM61v4r+PPfXBfYVdaHAKIty13T7R+QoCWRR8u0aiF@vger.kernel.org
X-Gm-Message-State: AFq9FYJ20Jhb1cMl94CxVw0tQawXdb6safLNNz76RS6AwiTTFffGjyNQ
	3pYUzmYcT9taCaaE3B0erqcjVERaJxOyRwSTQ+k/DTgKIlI0z0uPZjv4xC8jL4jhUdmzvn2cKoN
	5aX/nYS2XO3VOKuIKLWvTN2LYwZDb78vi8MFTiv2pTmiPnejbpMl3OTboCJ6Fhl30+CF6
X-Gm-Gg: AYBFou1/MukHVGxfwLhUp0H6S6yDmlzzZr0nt+zkXQzMNZGcLIfn1tyqmqFtaTeDkK2
	w305PB0PO8kkN20VbOMgEWvlme0RA8If3NXemwuGt3yiAhtNt+FdAlfRuDpr+PmFUf3qqAA02y5
	X1CuTRvjQ0aRtGQCDqhf3I8nw9sl2DOteCNo6TgoFOIJzZaMTNj7lbdMRfoOmcvFsApCWGGHp0H
	AWPVqKlvgxr4fK4hh4+1tozYMo9R8W0BfyOPOJCI7SHZPzzfCCJaBHS2o+BMbHjRbbIqlQG3rNc
	R4UyXfrDi8UMXO4XqJMVja3OyWUOCI8rCgGNZEvPDsZo/1GOgcEcrZv7iSK4iOebm55D7ZnfFM+
	TtcCaEd7g2eoTG/7lOnk3iQ==
X-Received: by 2002:a05:620a:19a0:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93f57f72681mr930306685a.5.1792661672544;
        Thu, 22 Oct 2026 02:34:32 -0700 (PDT)
X-Received: by 2002:a05:620a:19a0:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93f57f72681mr930303085a.5.1792661672043;
        Thu, 22 Oct 2026 02:34:32 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a55c001sm84619866b.31.2026.10.22.02.34.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:34:31 -0700 (PDT)
Message-ID: <e26f0360-aaed-4e40-b1b2-956c92d34db5@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:34:29 +0200
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
Subject: Re: [PATCH 2/2] arm64: dts: qcom: monaco-evk: Describe the PCIe M.2
 Key E connector
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Wei Deng <wei.deng@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com
References: <0303224f-4c2c-46ec-9866-5ea1fd0fb4a3@oss.qualcomm.com>
 <20260825092715.5794-1-wei.deng@oss.qualcomm.com>
 <isbrpaztfrgwfcleujrn4w26cshbi2mgn57tbh5bubvsegn6lc@jh3ab6htvd24>
 <83b67ab2-ab68-427a-94aa-881454f457ba@oss.qualcomm.com>
 <CAFEp6-2KDxDrfTZLN7KPRg=aavj8nqQr7ftna23n9C1Cpbwwbg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAFEp6-2KDxDrfTZLN7KPRg=aavj8nqQr7ftna23n9C1Cpbwwbg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNyBTYWx0ZWRfX6BgzKIfAVVYn
 FoD8tCFaGeNwdOoJQ34H27ssr6B1W89HYX42X/4tzr9AQs4O0xI2Xh7uwR3G0/vhObXyv+GTL5Y
 ht4wZcTjc5LOJXLIzI4QAeQzLv6SGvGeE9hiPniy9jK4MxwOwzocImqRFfhRKyKlB4gm2LtBDKl
 pNXVPL44bmYpCoGxKnZVqUPKCnSwPVF9twLNl9oy+OPSuJEGY3sZgItCgY+gvdJ3Z6bDfG3b6MX
 0ifny3cpTi4yj+Rrb6QSxJKkpVWmHb/PThbgm58cdW/XZBHY4uMoFqWm23CHNomSxVnKO9Q0IN/
 pLsoxlHP2NZhnlrXWwz7vFJozEtIPWCuAJQn2SHFtKkAyIkb3zrv74ZzyZyeBnnJbHUe3iTs+by
 QbQoEoLwSfjfby8RmcPolqUZMiTItIPemYwUU215kVfp1mgPJAynZKL+evncY5as0aS11glXtjE
 MvGNFlVw94hsiF0f9Qg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNyBTYWx0ZWRfX/xhZZ9OJfSMY
 zvO1N4KiBSQBB4rCHnapZJe1se7Wj5CtG+9+IaQuLRi5k66hyWvlduoExCX97YzMzV7LkVBqUck
 aQKc2TdQrfG+4kBk4ZI4b6ovQrzOyuA=
X-Authority-Analysis: v=2.4 cv=QPn91QLL c=1 sm=1 tr=0 ts=6ad9d8a9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=9AbZo8Gtoo8lc68VITMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: wfyyOcFwrcR22Cz-1V0h77cypB_S99pZ
X-Proofpoint-ORIG-GUID: wfyyOcFwrcR22Cz-1V0h77cypB_S99pZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220037

On 10/13/26 10:13 AM, Loic Poulain wrote:
> Hi Folks,
> 
> On Mon, Sep 21, 2026 at 2:38 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:

[...]

>>>> We are adding M.2 Key E connector support for monaco-evk [2]. Konrad
>>>> suggested moving the port/endpoint anchor nodes to the SoC DTSI
>>>> (monaco.dtsi) for clean DTS layering, so that board files only need to
>>>> fill in remote-endpoint for boards that actually have an M.2 connector.
>>>>
>>>
>>> This means, the dummy port/endpoint node will always be present even when the
>>> M.2 connector is not used. I don't see a compelling reason to do so.
>>
>> I don't really see a compelling reason to defer re-defining them to each
>> device DT either..
> 
> Adding an empty port/endpoint at the SoC level is problematic for
> uart, port is not always expected, this depends if the uart is exposed
> through a connector or to an onboard device. So we may end with an
> unconnected endpoint but still have a bluetooth subnode, which can be
> a bit confusing... Also why adding a port/endpoint only for a specific
> uart in the dts, and not for the others? This is a board/SoC level
> choice to use a specific uart for M2 or not.

From my perspective it's removing boilerplate. Currently all USB and
PCIe hosts already define their ports and endpoints in the SoC DTSI
and if they're unconnected, then simply nothing happens.

Both 'ports' and 'endpoints' are an abstract property that signify
'X can be related to Y' and I don't see how that's a problem here given
UART is very much expected to be connected "somewhere" (with the
"somewhere" perhaps being external/a pin header)

Konrad
