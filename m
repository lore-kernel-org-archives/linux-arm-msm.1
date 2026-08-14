Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB7F3E7BC4
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 11:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786706598; cv=none; b=oEbTLzfRU2dpE267No1XHMxQAKELBOa/jZ0QTVOzWRxTTXPHqfvbxmpz05s14NKG8NyZAyGy+oDrRCyiwqi3lx11zvcmPcXNL19tRaHbDsrBfp+RbzuXEtc8PYpIPePDfVSH/CFBQNhXmXBXOHSD/1cCRmpKy7vgfEQ3Oa8eOVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786706598; c=relaxed/simple;
	bh=0s7ls8uI4AjkUgJ5QjH3UyFF6Aus5IsT04/4v8aM+5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tnlk2FK/Oe99KvGNM7FqitvOkb/G/w+F07tmZOk08sB6GBPXWRtfvMv2QUBwKGeA9pBfXxejH69/uhUHxqHgq+ojuVsfTIoNOvXwX7429RBvNPf7ubNZfA7eJ8gIAduoENr3WH4a7Xdyhm48BV3OpntZMcM9NDojJTtmEePZ/Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q8xdLhIP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=THnYkYGG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q8xdLhIP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="THnYkYGG"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EAbYcS248094
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 11:23:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IJl510jtDnqTBZetoN/dQyDIiOAAFqFnc2CEwL/2ZpE=; b=Q8xdLhIP+RQ0W3Qb
	hrnjp9NXwhot2V9alb0gEvgQD3/ncX92E07nGYR7DCkb3b1UJ8PIy3vPFugOPqRx
	ns+/7GVS4b+2dsovU47ALYD2ZB7WYyzCJT2GSpsr5mspzjL7vsdx9/U043bGiuch
	xU3QdcMnObKMUJkstUDGeCVpf5f8MltARuh1ykfwpmJQkknjlux/gMz3vrUgWyAL
	YhV1VHRsLTRNamYyXQyaRn1BpvJzl+Qck8VJl1gnUub7AEw5LnWq3yxaQ31r+Lel
	xMniEPCsHS2u48U4DMAq4FQnickPRdO5W4/E7hUJNN7UkvyQByXn2rhMfaIpLabn
	zr1M+w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1hgy41vh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 11:23:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5174a23afcbso13818481cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 04:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786706590; x=1787311390; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IJl510jtDnqTBZetoN/dQyDIiOAAFqFnc2CEwL/2ZpE=;
        b=THnYkYGGmtzuUNjQSTF5rGugYjeChTElYj/0de+znhM/2GZvWjhOISlZ4jin4YY3NH
         gKHt1L2ro8r0jI5vKRZ49sQ5RnVS9A3rR/JxSFiHsx/jycLmzJohmR4vO+yLRLX3vWRh
         UV/+P1uqDA16pNte3CsBMLxMjlzQfSPItxUUvVHTb5jznMOc8BZ4VOXdoYhIbxlOGs5k
         W90k/4526MUkFt1D9G5pTWRzhyyoUsDeOBKb2mFH0Tna82q9Q+xvmom5yu2VMZwr8zW0
         myNquxjKMYbm5iT0linussQPQ3vZY/bIiF10MV4jf3l20T0ePU+/QUv3GwgYenDugwsR
         on/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786706590; x=1787311390;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IJl510jtDnqTBZetoN/dQyDIiOAAFqFnc2CEwL/2ZpE=;
        b=hAIFznJWOGqzDQp7HQHulR8H3KKvkSnQV8qaufoB7UnMLqMyw7vA6NqNlEQfa24VcU
         nuMfiM1PXRJuY2kh9kL6q0LB3mj+Z1Ouucok5n1kNZ5UBi9qniGbshcN9utNA5l6+sGc
         3psh16FK9IFaI1CZz9RuVLifiim0Ba75SIuMiNwG2HrMuaKrnnr2Rq+7rVGFa2D3Imzg
         P77c4i9m/YKExRGEPkMWf5I5GG60lwZ8WussYAOYTlM3/xU6ZyZjh/yFt2nm8ikYpc7p
         Sgc7Jc3TddHv+m2nJ5XKpE0j3I/NQWFw1q2r+9rEGrtZZu1CLlZx8YSeOXD7zRK9ZLc+
         ru3Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro2QoEBRnHrn8iBd6f/JTYlEuR8E99IKEcQL3BxN6Kcxdv1qhfVaPbH40gHvJ6XggQuJMictpKtgiQxDh8g@vger.kernel.org
X-Gm-Message-State: AOJu0YxGPzN6b2y+3qHCTX9KjDxu2r9VG0Wgu6ZVGaruRQg1bPk5ZcEX
	rwnydsHHYyq1P6qKSUtc7zzCjBw/dsBcIIqqUkG6crR/XExbbFKpi8Kifuvo4tKalNMfOcX1aA/
	EV580bKf13f5LuofAfmIw0krJclGI0QJj4IOnOppvEesVYDI3dZwuDsnZf+1W0pFMAgtY
X-Gm-Gg: AR+sD12Al+XMPcoDhHr7dPHAbGVlXOPmqEKCcN5Sh4BhEEpwg4ESwh6CbOrL+QWqrnq
	kqfbF8GBJ7u/jAuU4lFm+9qM/Vhkv9MR7EwnkQq7KCldtMWYLjLQBKwWdCeSo1+oO50eYAmpUS3
	P7XFY5u2IYNUEjzzNiiNdYXWKkUFgNgx1kEHzdg98av9tD+Era4u0tHLXzBvg4tCiZ1VvTeY18Z
	Is+BU6ipz1wWm8rCCpKkk5p4iAQ2DSLXmA3VioJAn4S/Qc8facEZNl+sTYqszMvRyUcha5CEEzW
	upIFqljW5Eqv+zmEY34cMTC85RDL3pL1SZthMwXzN2ybBZ9aou8ZoO+wod9PeyTV0I4gesUNqiP
	QhWtx45sZ/vZsx0ZbOlzJn2XkOJvl8qTKLIgAlXOs2/mhAJlqmz+bhXmE80K8piK7z8OvvIZaSw
	5c/fgG0zrrVzhA
X-Received: by 2002:a05:622a:4c18:b0:51c:f3e:7819 with SMTP id d75a77b69052e-52d854ef5d6mr58425691cf.39.1786706589872;
        Fri, 14 Aug 2026 04:23:09 -0700 (PDT)
X-Received: by 2002:a05:622a:4c18:b0:51c:f3e:7819 with SMTP id d75a77b69052e-52d854ef5d6mr58424851cf.39.1786706589372;
        Fri, 14 Aug 2026 04:23:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a130870bb8sm5428121fa.5.2026.08.14.04.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 04:23:08 -0700 (PDT)
Date: Fri, 14 Aug 2026 14:23:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Andy Gross <andy.gross@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Pierre-Hugues Husson <phhusson@freebox.fr>,
        Marc Gonzalez <mgonzalez@freebox.fr>,
        cros-qcom-dts-watchers@chromium.org,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Aniket Masule <amasule@codeaurora.org>,
        Malathi Gottam <quic_mgottam@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Daniel J Blueman <daniel@quora.org>, stable@vger.kernel.org
Subject: Re: [PATCH 04/22] arm64: dts: qcom: hamoa: Reserve low IOVA range
 for Iris
Message-ID: <vmbwxbt3a6pg5fmx6zmdq3wedqa25ii2aelbg7nv32spz4mb6z@b6aq5bxprqpb>
References: <20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com>
 <20260807-iris_iova_600mb_fix-v1-4-3996f67e33f9@oss.qualcomm.com>
 <ruow4uus64krlpy2gvm3g2d6rq5kgmgxnlhstmecil3gw7lhkd@2golvucd473l>
 <20260807162405.GA896590-robh@kernel.org>
 <c3hVumMy_QnRbUmbFTSWGjkfG7lPjGFEcZfPsZeGQ57nWKkhlBL3wgmcDcAgT9cNb8Ju3qZ_sSKgHk8vmow0xQ==@protonmail.internalid>
 <6ee7f32e-eb6c-e264-6f0d-541555f8fd62@oss.qualcomm.com>
 <56b3dfcf-b1ad-4192-8199-06c80cc5d124@kernel.org>
 <CAL_JsqLGOz7Fh=AsM+g84=Uko10YXU4QN1buApD3CJMkOmsebA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqLGOz7Fh=AsM+g84=Uko10YXU4QN1buApD3CJMkOmsebA@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA4NiBTYWx0ZWRfX8NP6wQCCG1mV
 zD61BO1t3fnwBdoqIyZvAl87Wgojid/jeyCrAUwEauYjIPUoRBjUXrrW1xEJrS4Ek11ucO067Il
 uUjgBvxVoUyVbqX1l6+hwkX4pMqhIE2V3Q4pSAuKzK9mdLVDITR9oI5ECjwbuqTtw8kMIbFdqXQ
 iVQ6qOYAaBNCIdB6Bz3nZhBVtTuPDLHDqalGu3Lyzh6WE2nX0cxHlLG46YQNbHu0CTP/GYoGY+s
 VySI67YfYrLHmQ89plWFMYtigE/kcgyaCN1CPg7xIZquyvxHVmjUoSMsHHblWV+wTAM6lgjAa/C
 oVz//zOl5vLYcWbCa+72va22830kXqiYlLklIkh7Xd5WGUcfpWE0gnM+Bm1+KhddNX42A53gwse
 AEjPBGTREHiAqSJpAztqHloJK1Vx0TYMQQZs6iLOxAaEZEcCu+T0XiVHlveFMixE+bNEXfTv6WO
 02S3CJUWwLFhlkXVYMQ==
X-Authority-Analysis: v=2.4 cv=AaSB2XXG c=1 sm=1 tr=0 ts=6a7efa9e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=NEAV23lmAAAA:8
 a=YG64nluAAAAA:20 a=VwQbUJbxAAAA:8 a=t9ty7G3lAAAA:8 a=EUspDBNiAAAA:8
 a=EXOReion83RDj_Asv7IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=CsAS6f0m0zARWR-uHzm3:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: EDABChTdI-BsYNY4wV8-48vFuScdDzP6
X-Proofpoint-GUID: EDABChTdI-BsYNY4wV8-48vFuScdDzP6
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA4NiBTYWx0ZWRfX+u71R9dyCPGr
 eeZYgu0hTqaWhyFgIuVOMz+5g87HPEVClOXBE04DFp9zwZvpzkyuH/E4P359XxqXygA4nEgKzyT
 hHHdOTOpKve2RGlYR5l+AHAwcvKBdMk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140086

On Mon, Aug 10, 2026 at 08:47:45AM -0500, Rob Herring wrote:
> On Sat, Aug 8, 2026 at 4:55 AM Bryan O'Donoghue <bod@kernel.org> wrote:
> >
> > On 08/08/2026 05:37, Vishnu Reddy wrote:
> > >
> > > On 8/7/2026 9:54 PM, Rob Herring wrote:
> > >> On Fri, Aug 07, 2026 at 12:03:50PM +0300, Dmitry Baryshkov wrote:
> > >>> On Fri, Aug 07, 2026 at 01:54:48PM +0530, Vikash Garodia wrote:
> > >>>> From: Daniel J Blueman <daniel@quora.org>
> > >>>>
> > >>>> On X1-family hamoa platforms, the Iris VPU reserves IOVA addresses
> > >>>> below 0x25800000 (600MB), primarily for secure non-pixel buffers. DMA
> > >>>> into that range, from any other stream id would triggers unhandled SMMU
> > >>>> page faults that cause spontaneous device reboots. This is readily
> > >>>> reproduced with one or more browser tabs driving multiple concurrent
> > >>>> video decode streams.
> > >>>>
> > >>>> Add a reserved-memory IOVA reservation node covering [0, 0x25800000]
> > >>>> and reference it from the Iris node so the IOMMU layer keeps DMA
> > >>>> allocations above that boundary.
> > >>>>
> > >>>> Link: https://github.com/qualcomm-linux/kernel-topics/issues/1157#issuecomment-4458933574
> > >>>> Fixes: 9065340ac04d ("arm64: dts: qcom: x1e80100: Add IRIS video codec")
> > >>>> Cc: stable@vger.kernel.org
> > >>>> Signed-off-by: Daniel J Blueman <daniel@quora.org>
> > >>>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > >>>> ---
> > >>>>   arch/arm64/boot/dts/qcom/hamoa.dtsi | 13 ++++++++++++-
> > >>>>   1 file changed, 12 insertions(+), 1 deletion(-)
> > >>>>
> > >>>> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> > >>>> index 8a96ea1bdb9c4c409b2af997680d8c13fed0643e..87f424765d513c97b06303bceb75ca9f176d2ace 100644
> > >>>> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> > >>>> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> > >>>> @@ -666,6 +666,17 @@ smem_mem: smem@ffe00000 {
> > >>>>                    hwlocks = <&tcsr_mutex 3>;
> > >>>>                    no-map;
> > >>>>            };
> > >>>> +
> > >>>> +          /*
> > >>>> +           * The Iris VPU reserves IOVA below 0x25800000 (600MB),
> > >>>> +           * primarily for non-pixel buffers using different Stream IDs.
> > >>>> +           * DMA into that range triggers unhandled SMMU faults and
> > >>>> +           * spontaneous reboots, so reserve it to keep IOMMU
> > >>>> +           * allocations above this boundary.
> > >>>> +           */
> > >>>> +          iris_iova: iris-iova {
> > >>>> +                  iommu-addresses = <&iris 0x0 0x0 0x0 0x25800000>;
> > >>>> +          };
> > >>>>    };
> > >>>>
> > >>>>    qup_opp_table_100mhz: opp-table-qup100mhz {
> > >>>> @@ -5439,7 +5450,7 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> > >>>>                    interconnect-names = "cpu-cfg",
> > >>>>                                         "video-mem";
> > >>>>
> > >>>> -                  memory-region = <&video_mem>;
> > >>>> +                  memory-region = <&video_mem>, <&iris_iova>;
> > >>> I don't like the idea of this series, because it _again_ doesn't tell us
> > >>> the truth about the hardware. This typicall ends up with bigger problems
> > >>> later on, when it starts to affect other bits and pieces.
> > >>>
> > >>> I don't want to NAK it, but I'd strongly ask to reconsider it.
> > >> I think this is an abuse of /reserved-memory. reserved-memory is
> > >> reserved *physical* memory. Reserved IOVA is a property on top of that.
> > >> I'm surprised this passes validation. If it does, I may go fix that.
> > >
> > > As per the reserved-memory.yaml schema document, the iommu-addresses
> > > property for IOVA reservation into /reserved-memory is allowed — it's
> > > documented for IOVA carveout reservations:
> > > https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/reserved-memory/reserved-memory.yaml#L56
> > I think that is an entirely reasonable reading of the text
> >
> > Quote:
> >
> > "If no "reg" property is specified, the "iommu-addresses" property
> >   defines carveout regions in the IOVA space for the given device. This
> >   can be useful if a certain memory region should not be mapped through
> >   the IOMMU."
> >
> > Which is exactly what this series does. Excludes a specific IOVA range
> > from being allocated for this device.
> 
> But if "iommu-addresses" is the only property of the reserved memory,
> why put this property in reserved-memory rather than directly in the
> device's node? I'm only questioning where is the right place to
> describe a reserved IOVA.

Per the reserved-memory.yaml:
   If no "reg" property is specified, the "iommu-addresses" property
   defines carveout regions in the IOVA space for the given device.
   This can be useful if a certain memory region should not be mapped
   through the IOMMU.

I think this defines exactly this usecase. Would you still prefer if
Vikash moves iommu-addresses to the device node?


-- 
With best wishes
Dmitry
