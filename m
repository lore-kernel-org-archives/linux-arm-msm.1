Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C611F3B42D1
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 05:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787550231; cv=none; b=JjykpOlATV+a8i7+8AqXZdc/4rM5TcD/uNS7PMffOxlBSXy0153x9Vzr4E3IIUlfjb/4zZWNNIu/0CECmvi0G8nkABsjsOmuSr7miCMUCCnZMXYsv9E061LrzBquDdW1DvTYAp5edhK3JciP7hQDfR9Q+Luv6/oLW9vh3C7EbIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787550231; c=relaxed/simple;
	bh=7oTNqVF6WEleWtAhcz9BRLPYUrFbR1yxDAiibCRuyl4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qn4WpimNQt87FzX8JJHPf5CFsR4a7xQ0H94e/GFIr6JcusXwFietDSH7OY2ohd81d9R6MKEaZUV5sRy9zWQGbwgN+NN5KANzpBb/NwpDn5YC8QOf1wbgZWLbd2pcURVnaPZ4tntMeY2u446acDEKy+2A/7Gfta15OUo1PWXZKe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a9xEID2X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KBrLERlA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a9xEID2X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KBrLERlA"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RBO82058202
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 05:43:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kbi0FbKM+Eh6oZscD4lAY4TeaBYjCKyAMiEW984jyCA=; b=a9xEID2XwKb3C+9R
	T8Jr/6PAahMGh/AxJFwKWQ6MJcbYsB+uepo0YpSPF4esB39q4hhHerXmMFnzqVDy
	RNPQNQrtHnctKIWPk39uLIwH5G74L3db2u4n5djKsB7iwWQTzJowxztCwo18BV+l
	IkogB4R2pKOyjNUpQac1Nio7keTW9q2ggwBTH5dNc9uMh/Hpuyv7m2RTve9TVn8L
	OlEpqOflEzbX2Jh27q+cm67eZ9OY5TBfaeSoUB0bdP5wNGD+kRURSQps1q6cr2J6
	Ye9uGnt7EYFSp8LVRn9vnhncAU8wXjbLUNrD6qZXE65k79I4y80Cc+Wr5bJi9IAK
	d6vPjw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8bdr0r0v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 05:43:48 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb48f41343aso3261773a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Aug 2026 22:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787550228; x=1788155028; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kbi0FbKM+Eh6oZscD4lAY4TeaBYjCKyAMiEW984jyCA=;
        b=KBrLERlA8chm0GDe+2L36QAy86y/Ly2EYqkqIKw7kXdgrW/e9bg5/OMXR9klXx2i6y
         WNlPPLwgDj/YHfWger3CmGgboP2C+jf8g9ctFEiUqCVPnSSHUP+pbeg1I51cY4x1bQKL
         /S2lY/nN9xorlcd1pQitmabGoBC255wcE9xhop+VH43xOunrECWK8XHVJDfeVkv0Ly5e
         0PPpcxs0uhrNGsm6O4ynOCSfBT5PpTINeLYMWpEQUXlScRiflR9p0dKuk/D5C6JBKa5o
         ejsHanJ/vk6RWNVo4kwNNSCBNcIuIpmogn5OpiPXrdU0SAAQgwioBsH2vuSIgZ9JXxO2
         Sa1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787550228; x=1788155028;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kbi0FbKM+Eh6oZscD4lAY4TeaBYjCKyAMiEW984jyCA=;
        b=ONX/QqrT9VsRLpr5oz/xEamQrGxXqew+/qWmE14quVGHxqAeSriReqk6TobZc8jqtG
         rXJoA1I44PmENWQVDhNWXh9zTWns0qhTDuGNkftKzInhvF7jqqTmsB5uic1Q5VhHFA9l
         ncTCPnmqqhU8DwGyWLCO+FJcj/WJH9GF+phukhRGR+qeHJ9AcZ1C0ThyZS4YmhmdI2zs
         ADRVhClCLfSEmgng8JXTG4C/Igw+UTKJIF7Fk6QOwe+MKCWgvLc4gWaj4BczLF7oV259
         CFJ6SVjzWI3F3kafILTjwjjNmK1EbVgPPGqvUNk0I8jYe6zDoGHnFg00t8yBq453prWZ
         n6jw==
X-Forwarded-Encrypted: i=1; AHgh+Rr3xBMJvVKowOi7F+IQUb+ZuNj4AAuhxjMqMDNAUVJdvYyINIH0t+ZrJgiCrL3Ywrqyw0L2x9xoa8+sTIsz@vger.kernel.org
X-Gm-Message-State: AFuF++nsKuhI6ofCOWgWydHQFn/UvAzIe82k3FZxYdSr3rPpvjSlSmKn
	aOoqle5dVFhTTOudRV/pDQE29k1CarzVntbcxiikuhlPdsNtbfSBUJInrbCyO5akF6kRDwJGIE8
	8jzkefbDW8oG34VI9rT12Df6/BK6BazBUqE79RmxN5KFdFNdnl35fz441X0AUsOQI/AwC
X-Gm-Gg: AR+sD10QQKL1l1+iP4MwTcDFyJfT5ElLBzqOsmJe8iJSgkQA5irfMKa/7t90pkapGMq
	Ndd4yzwkUb3FR0Wgv60Gi1vorqvI7OCAceH4XL302tZDbaqaCg1QQHix99zoz1zBqPK0pu/m2SL
	o3xX4c7LXjTrMTKAiirRezhoLLVp8QvCRxeBF07hUAgHjT+r9Jxil4yw2jr+W98+U1jHfjkRBFD
	mLMlUSdHmrhc4csqFxx1mzdvw1GlJC+yxog5t54f+g8qlbpY31QXkZnI6ODBXBUMc24XV2uW4sq
	vQdWI/k15hZdB7b+GX3i605Bn2xVizFefPtBhnIlTgMXrQrhRzaoF2A9qMGApTP2xMvq6Jrtbu+
	/WaNevUiqVncLV0dzYDd+JjMKSHTni0Mn35BtyzZRahj63l15j1iTah+88Kuwj275lWAMi9uhB9
	+kAFGajTfi2a1XJT+9d+Vb
X-Received: by 2002:a17:90b:5207:b0:38e:c1ba:4f94 with SMTP id 98e67ed59e1d1-395a044f253mr39216366a91.2.1787550226488;
        Sun, 23 Aug 2026 22:43:46 -0700 (PDT)
X-Received: by 2002:a17:90b:5207:b0:38e:c1ba:4f94 with SMTP id 98e67ed59e1d1-395a044f253mr39216286a91.2.1787550225974;
        Sun, 23 Aug 2026 22:43:45 -0700 (PDT)
Received: from [10.79.116.118] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e4a20e77sm8766395a91.15.2026.08.23.22.43.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 22:43:45 -0700 (PDT)
Message-ID: <306b2102-a7bf-4c29-b67c-df6ba5fbb7ee@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 11:12:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] clk: qcom: gcc-glymur: Tie the CX power domain to
 controller
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
References: <20260715-glymur-fix-gcc-cx-scaling-v3-0-72eb5adad156@oss.qualcomm.com>
 <9a3b9b76-abb0-47a5-ada6-cd0a576b0782@oss.qualcomm.com>
 <3df2f139-bc7a-403f-bece-7e820b202bd1@oss.qualcomm.com>
 <812d71fe-40e2-47c8-ac4c-ddb8a45f582d@oss.qualcomm.com>
Content-Language: en-US
From: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>
In-Reply-To: <812d71fe-40e2-47c8-ac4c-ddb8a45f582d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA0OSBTYWx0ZWRfX53MVwB7GKftI
 CGwZeh1DSqE4Hu9D9rgvvafPKVVtsKTlqEiobGCun4yAGRrHAlmJHXIGxEqKbvFz4YpX6EFn7jd
 s2YFhAMgGzV+w0GmaMxzpLv/JoWjbX1QLDMXnKUGGCGizXdGxI/M4mpmcmTHAh38TF5+3n2CZYD
 g1G1w+E8Q/SHeqsaICM4LJjjzN0QDH261ZF3EAUjDQavHCAOlByunzgK+Wwu5IpyZ41UU3Gdt6K
 +GoMwuuVCkRfU32fpTSjpZhAQQ9HQXzF2CzmH+J+3sOSxX8xlrKdAQEnM42kxm6FwYrj9pEKUc2
 N1Zh0YEsQwdWTf5Ua+a7H1OoomlH0CtROIULoRYkbT4PHdy8QOExqj6qobLWX3MFHU9en+Y78AV
 xmtLXBN8vWRPux22hRh9nmEb9KBd23vGNnXrxqxrbt05p1BQ5BqRnp/CmLMyolLgdRIaiOHhrat
 h8QgeRl5ACvzbRyT2vA==
X-Proofpoint-GUID: B7rcDPIyNikk3or0ZB3-9UpmdUQXytda
X-Proofpoint-ORIG-GUID: B7rcDPIyNikk3or0ZB3-9UpmdUQXytda
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA0OSBTYWx0ZWRfX9l5wYHUp7IX2
 CXZ5HzRddls5FsVY1gGc+9DnZ+ujo1jGe16p+nUE144PrhqLXy0L4gmFbIfA3kBVMMEXzSb+fJ/
 gfd/e4cUwcrPchOpWL556tjKzCF7Iso=
X-Authority-Analysis: v=2.4 cv=W8cIkxWk c=1 sm=1 tr=0 ts=6a8bda14 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=F55jpGqvRUC9acNfLbcA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 clxscore=1011 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240049



On 8/21/2026 4:04 PM, Pankaj Patil wrote:
> On 8/17/2026 3:40 PM, Konrad Dybcio wrote:
>> On 8/14/26 8:30 AM, Pankaj Patil wrote:
>>> On 7/15/2026 6:59 PM, Abel Vesa wrote:
>>>> The suggestion of having the CX power domain tied up to the GCC
>>>> controller started here:
>>>>
>>>> https://lore.kernel.org/lkml/fe210f0b-692b-4c45-afc4-fc2bc5e57854@oss.qualcomm.com/
>>>>
>>>> and then, for Glymur, it has been brought up here as well:
>>>>
>>>> https://lore.kernel.org/all/0248dc51-1036-426c-b1de-dbc71696e2c1@oss.qualcomm.com/
>>>>
>>>> These plus a discussion off-list led to this patchset being done.
>>>>
>>>
>>> This series prevents cx collapse during suspend on recent linux-next tag: next-20260806
>>> Reproducible on latest tag next-20260813 as well
>>
>> Yes and the ""fix"" is to disable the GPU nodes because the custom
>> runtime pm dance done in the gxclkctl driver keeps a vote online
>>
>> That should be fixed instead
>>
>> FWIW ath12k is causing some issues for me in this regard too..
>>
>> Konrad
> 
> There's no need to disable gpu nodes for cx collapse on s2idle, I can reach cx
> collapse after disabling crypto, camcc and evacc nodes along with reverting
> this series, Specifically arm64: dts: qcom: glymur: Add CX power domain to GCC
> Can you share the steps to reproduce? Are you running additional steps before
> triggering suspend?

GCC clock driver on Glymur has gcc_disp_hf_axi_clk marked as
CLK_IS_CRITICAL, doesn't that mean we will always have a vote on CX
with this patch?

Taniya, do you have any insights into why this clock is critical to be
left ON always?

> 
> 

