Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64555545D95
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 14:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791987664; cv=none; b=RtJt9w2dMn2qhZyn9UgGZalZzUBpN3MKeOql4Ipox7cua6XVK4ilGvo9fgL9h6Fn3RLq2VUzBjr+FltZwsaMycE9pjxnvtI6bSUbkdJh9cjabK4nI34+qHolhwwR0IvuUVoGnJvKy5fKbVCuDOv+1u+46s4gVykXpcIW1XZGMng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791987664; c=relaxed/simple;
	bh=XGNrFoZ7MV8C7/dY+VSILAwCYiTvCmyJQJRuuRE54UA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eubxf+XNs17lVrkm5/g8KiO//MHvtDf33WLbDzZCeo4uo6ruDQUMjYzL42yPxo6T2L8NS/JOeAR2rQtf+U8vD7V49/TdyYlKT8mYkBuMkbaL3TaJo2tVcjf8C+pvmzXj0wV2HqE1y10rbeRfZg+75I+7LqFaU4Rlxm7I2hcE+j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XQsQ3V2+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zmxg4MYK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XQsQ3V2+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zmxg4MYK"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E9eCdR3696187
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 14:21:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	guDtRT+BFrNgrMr9QvoZtjIgkyZewpK+lc9ir5W7b48=; b=XQsQ3V2+7aeVELol
	Ty82a8+AuF1t9jlkHQFWPGqV0R1T/GK+hcYNI/jB/xE2U98nVKQjh5LTXxgH9Z/p
	vXORGa0AWtbQzyGpze8vXqeSkm/EQSTQUBEDHb4PIce784LMrvhQQisXC/+VrQg1
	uqEXXg1kM64HJJ0Vb6vywpDypIJZ+5ofYbMUUCa6vkaVMV+zhIRGXm+OyNQMYJmA
	tdBDVH3qrmhCc5rDyyGwV2XdSDQ5DWw1QXD1+5F3vt9ggiq/cVRAAQ17B2qEVMLj
	3RbBcP91MMTjRXH7h8bYm0/ezdrYQmBFfkFgDhiK2OgCf5/fzf4oytw483Dyw4iM
	FYpRpg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha7aeh2sc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 14:21:01 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5e705718bebso136829e0c.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 07:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791987661; x=1792592461; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=guDtRT+BFrNgrMr9QvoZtjIgkyZewpK+lc9ir5W7b48=;
        b=Zmxg4MYKo/Vf6BpjiGU32+iH9JlFOnChl47qhzzUDhEgDct83FrAbY791yHTDWU4B/
         e04244XRbbCnLs7tCWGWqhIL1DQtDFeMBRfMn95judfW6WDkKlUFfDPUbWK28Vj2rHhe
         7exrpbRzX48U67+Bgzde1uZwS6veljbuJ1jLgW0IrTOuDkrsV76AbxehFBfP7WEMfBj/
         PQExJpjE7N7X0odTjCZxRyp0c7uwDCHN7T9WphZGrpGp0W7fAmqngr9/+90JqgjQYWr2
         DRDuOKHLEQlU/VOfHbkPqkfu2GuPEcbONX26w35YmXiwH81BymGzIjHP5uyrk3MpYdai
         iGSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791987661; x=1792592461;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=guDtRT+BFrNgrMr9QvoZtjIgkyZewpK+lc9ir5W7b48=;
        b=mhEJsxmxaMj1WCjW90prEBpTejbpFVy/jtfLPoWoSpxLAGt83EDgL8/h9R5Vx600qp
         ehjt3ecUibNlz43uaahMCgXCjuJIqJka+NBtieQZ21/ZKLjoaQpTx7/I/F1NxMxhBSWb
         DtTmSR6PBKzjiYHroA+w+/Vd7lKZ3DslPSnYOJFfmnoJvliYRKeYNxzy9uBTb2bl95MB
         urQmi+Eaj6oA9Je1TYN+XcV7ErvsAWDcCoIuUdVeJNAkfIGTcm0E9ayf6fzeGEjG6cWn
         Y9idLVTJcx4G0pr9t3scsEV9TDzmJfIBnvA/0h1gktZfdOGzSuNzdPRZ9wbhXC9B3uJw
         PIXA==
X-Forwarded-Encrypted: i=1; AKwUvByiA3UuWb+4/MKXGNTXXWMm5cmogIkMT8Rnm74Hr216xFsO8RYufAwSrPsFLZR4D66q9PdXDqLJOnM7a6BM@vger.kernel.org
X-Gm-Message-State: AFq9FYI+8o/q1HVppuaBFVZhSDFfBUQDA/lcm+icYA6F3tmMMNwr+n7R
	iqoM4Cpc7hDRvhTWEqLT8qHVKSVSsjkvtEfxencfOoQ9apc1qaX3bpnYcONkHujIMGPPV4NYk+N
	kqoGRMvSr5GZTMIh1ub9x6nFMtmJsHmQOcMGg90onf0sF8R7QO9zvNoDu/WVBIr4/Zj9f
X-Gm-Gg: AYBFou0hM4DAz9h2wNiB1XKupc2v5tAubm3XIqqhIlyCpZbJa7rhweFcQE6gfz1YjUP
	wMixs94QsqmWhuBcaUQ/cUpA63AmrkpIozWrs34NpejHfeFy+OiMtwmXg4FPxMAqUdKERFESx2Z
	5ylJU8FMulnPY+WD/A60xs0048EHs88WqfVlMaqxZ2sCTulGzLjAKndelIVmoDq/QLw9qSEV53l
	6Pe4MI630LksMHLBQnnvJ+cH+wTEVkt0x9QmuCCCBd751DfqM2KqRulyueOEBuxgwSTIPHp5dn5
	WlJ914hhQDAU3JwKAA7MtkHoCj9UHp8CWTUsnE7rK86hyVTOzg30vzn9Oh90JRBDsV0GmChMUVZ
	f14QKqqdCABB5WFmWU6vtFg==
X-Received: by 2002:a05:6122:4a0f:20b0:5ce:bde0:9b53 with SMTP id 71dfb90a1353d-5e91f49ed42mr3157616e0c.3.1791987660497;
        Wed, 14 Oct 2026 07:21:00 -0700 (PDT)
X-Received: by 2002:a05:6122:4a0f:20b0:5ce:bde0:9b53 with SMTP id 71dfb90a1353d-5e91f49ed42mr3157584e0c.3.1791987659925;
        Wed, 14 Oct 2026 07:20:59 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b20388ad72sm1182036a12.24.2026.10.14.07.20.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 07:20:57 -0700 (PDT)
Message-ID: <d82177b4-8e93-4818-bd4d-b4f696396373@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:20:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 11/16] clk: qcom: gdsc: Make GDSC parenting optional
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-11-3041b788e9f7@oss.qualcomm.com>
 <lx5jywz6pnwfcoczp4z6k55qeol3ruqkyfsutngmg6n3xqnynq@6jgoutrnav2f>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <lx5jywz6pnwfcoczp4z6k55qeol3ruqkyfsutngmg6n3xqnynq@6jgoutrnav2f>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: uTdiDy3-cPULP6AVYJj8qg8_JW4EBwbA
X-Proofpoint-GUID: uTdiDy3-cPULP6AVYJj8qg8_JW4EBwbA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1NyBTYWx0ZWRfX+lariIgZr3UY
 zPTxKFYda6zXRiHmjofy0eQvN8GF3ild1FtYFrwdHYLKdLMyLwDAnxPh6AxO3UqYpIbtLBnGI4y
 3vru6OWmWmvUMDkQn5hH5pYftujznwg=
X-Authority-Analysis: v=2.4 cv=NctzRGD4 c=1 sm=1 tr=0 ts=6acf8fcd cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=NbljYO6N7a6c2dGYBmcA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1NyBTYWx0ZWRfX6l5T7jPQKeRw
 G094ZHAZKTU1ZwN5rXXeZFOwvJPNJuLHDOIhy9wrFZBS3qwfl1DBYQwZBYc73oiOu6n9WapT9gF
 QheIIzVO2AMckpB7f4HPO9d5DqbuqSTpOLuCJwV++q1ybzYGf6nBLlt4Yl/tTXtiiQ11FlZ+8pR
 hDzAugvbl7B78fHKpzyCmIlkJiLn59J5e2kBRAMYFAPTyiQLecORKK5iV22fNgg+pG0kRfQacf8
 lHmJ0qlML4I6LuQG1xCjNwNRiDLXPxk195VQ24tfzSpW6rDP7aN9XbzoA/Mla4Md1KMPtSH+pM/
 hzoCmo4abY/9lNOgSb7UJoJxbW7ZqfulkpFOxaTca6zYtG/Qd5pH6AoYqDclrq1mwcOnd/EHVXZ
 EyphCYsYZj5t9DNtl0yuwT/WtBhKYBIkfSGVVEmMb63AzmveuEIrpv0T91EZ5EMn9GaalA8japs
 rcmDWTg4XCiq1x3uUKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140057

On 10/14/26 4:17 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 14, 2026 at 02:19:11PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Clock controller power-domain attachments currently become parents of all
>> top-level GDSCs exported by that controller. This conflates resources
>> needed to access or operate the controller with actual power-collapse
>> hierarchy.
>>
>> Allow callers of gdsc_register() to suppress parents inferred from the
>> controller device and its attached domain list.
> 
> I think, each GDSC has a parent (in the hardware). If we don't represent
> it in practice, we likely need to fix that.

The next patch allows setting a precise set of parents instead. Perhaps
this commit message could be improved.

Konrad
