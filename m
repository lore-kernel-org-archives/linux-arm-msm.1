Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856E0502D45
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 15:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791991393; cv=none; b=L20UECmfvRTSvpucej0FcF1J1zH/nRzD7MEj3hEUej1TcvHz5mUOcj9912pEPZdIyskhdEcKUaXTJGGC1xYiyBB9htdWSfKMq5MOoKCxxXk5/b4x1/M7Vio66fkY9fDtMirqZ6zq1XL0K3fKgGNi69hPlOaBJ78Bf/X3dRMHxIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791991393; c=relaxed/simple;
	bh=gKFZyYRMaW+yGT+qZVr6vtv3tDPMrkptapq2/kB3icE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SK1EZY8H9IcIpBy20dFPVxxDQXcCeCx5Yvvsg+6DUnk7EtB7BHCdKYYIVIVp+h908Onp+MTpqMFaX/MAJFI2zSOklrl1G4nPSJOQnqUuBZ1VohCD4TWjE69++ZX0hN28aGjGaBICeewIKAu878GhhhmP6y2efkYydUmtGdK5EYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KFbK1YyA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JdRiNJNt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KFbK1YyA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JdRiNJNt"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEcX6m3209396
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 15:23:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gKFZyYRMaW+yGT+qZVr6vtv3tDPMrkptapq2/kB3icE=; b=KFbK1YyAk2uiYjsb
	uu4AAULQUxgDXyWgiaNDvbRph6/UlWZrH3ApI8eVIJgX9xdOnjfXfQksAuHcT+M5
	SVrCo2qhRrqADx29GQV37tgKSQaKNT2/6ixn+eRerddPtJhuBqsM38p/gyJZicai
	KbV98rVTA9AKoew+5fNnl6oeurINPpvoiGUy/NBw9LVv3lZYEG+5UuG6DcqchanZ
	WIKAH8hRtD0vKSSKgmKy0hGLT9FlPFdF9Bz2z/eFFCYGw2VqzfE6fF4DHRRRWRR/
	11wRy+AQEBf8gG1VofG7d+UpFSFFqMA+v2Q0HZT/IXT392so24+3NZO1vt4pZxX3
	eHx8Ag==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9ud6c565-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 15:23:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934a8cd3a8bso62692685a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 08:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791991391; x=1792596191; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gKFZyYRMaW+yGT+qZVr6vtv3tDPMrkptapq2/kB3icE=;
        b=JdRiNJNtH/3ziQ8EvrwFXXvJdnyxUpTMzwsyunyiEa0jpjZo0h75MGxzBhl4FSR5+q
         7dnjW5o8UoQS5nuWkHzrBqZBP09scQpXeEffNV+ZGG3EgDgkG5EbLTZl2XURUHSyOJns
         pxODgoy5y9TdvokvmELW/jte8qpGtxE3jd7Q7cXBmda2yoOvnaL8Sf+2rY8Ds5nO+WeB
         hDyd4PaYaTmnJFj677L+16iEeg7neZToLzqydFy3C02zfT3wv1+Ky50h4ma5kOUE7uaG
         6R8raONwT8OWxa5t8GO6hOv/XoVQVabPc3Bt8rvykd25DVemXZPJoTGYs/IUqS2bbDW6
         3oYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791991391; x=1792596191;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gKFZyYRMaW+yGT+qZVr6vtv3tDPMrkptapq2/kB3icE=;
        b=PPgzdG6Onv9KT1TPrRgZeopSj5QxcCCyUPZ1qic8KIJ9Fcjk+Y5b0ugAj056xQZyQn
         SzGgIHFGBM0AsSiTnNQwTzhC6FLnXjrdUcd34GroAymWv/eJSYABiSeI2T5VZNxkMgc/
         ufQROUWC5/yNimr5TmjvVF2iJX8Z0KaCBKdfPzWgqPUD0fabVajice2ZBRv8CALs+tdX
         ZF/DiXsJ3El5KpVDAnecfLNlUu67t+cGVvI+GkRjoahSaUTOseEA5HXbAOX8jBJ1c90G
         yLVlbi65Fmst81XPyuaLbXG4z+uHZQIlxSKYmmZVZOIcL++UTPGwQQY1ZIB5jM5kT2/e
         /jMg==
X-Forwarded-Encrypted: i=1; AKwUvBwXIxAHaFiKV8WR+8ki2Je4BN6gvnDDq2q5GGHr+G2HDTMrQKhwFkT4mliQeP5olmGJhG5MBy6NYWafy5Pr@vger.kernel.org
X-Gm-Message-State: AFq9FYJAH8u5/RRY9mjd/n30N8BHKLjOY1KbLEhF2rn6anFLyD5B/uej
	qIl0WUS2HvfnsLzQSE0z1SjRqIxTIbirOWZifuWiQV9uiup48qQSBQXPIuw4jR6eBVCDK1qVNR2
	tpgknsyn/hMtqmevetqSCSmGBs4qCGLNrMlMh3HQKiZccu9eMs2WGjEfMaTIKrdUoXdW5
X-Gm-Gg: AYBFou3r+PZbBpyhrhBeubBV+9B8mlqbqhJ6MZte6RRPSZyZalo/Q+3rDF7dxXBeK94
	GG2Q4b2eSWjzBV7srdPPKbijlHUbR9k3MXcQk8BnrPJzabgytjyblzq5vvZYeO8jzYPre2HCqKB
	Tu3MS6hiL2G6uLFhjPlEGgkevYIWRA4epHmHHlRLaE9+J5EVBgpihYpjeqe6Ltr71dtxCnuy4Mn
	fkpaCkPeuRV6P7kh5C3KtPwasv4MOBVUVKYG7K44O2fGxqhE8zDZneXeSI8XjXaM0f/SopwG/ws
	CTKl1/zHFyiUYWDWs9BKVLeYB3kp58J5XlR4/k5MrM2XUbZlf5sfecqo/e8nHp6Neh1307HFHgg
	u/H0IAhbhptjd4s+NvYJGeA==
X-Received: by 2002:a05:620a:6506:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93ebcd2b830mr2689952085a.0.1791991390470;
        Wed, 14 Oct 2026 08:23:10 -0700 (PDT)
X-Received: by 2002:a05:620a:6506:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93ebcd2b830mr2689944585a.0.1791991389881;
        Wed, 14 Oct 2026 08:23:09 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b20383a22dsm1269905a12.6.2026.10.14.08.23.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 08:23:08 -0700 (PDT)
Message-ID: <f5062eed-f619-41f1-9e7c-71a7405e34ac@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 17:23:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH DNM RFC 13/16] arm64: dts: qcom: sm8650: Describe clock
 controller power rails
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
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
 <20261014-topic-qc_clk_dvfs-v1-13-3041b788e9f7@oss.qualcomm.com>
 <su6pmts36qj4hogxfthkrvjr2aod2r2u33onxifqanbarxk3tc@36qoces4rwor>
 <2ce49c83-b861-4a0d-8412-e8b3ff33bdd5@oss.qualcomm.com>
 <lyeiklz7kcjhotj43wir7xutru5wmjbrwfwauwbyzx5jcgpito@uyryg2sbmsf6>
 <924134e4-946d-40e0-8d93-2951aafda4f9@oss.qualcomm.com>
 <555cch3ceqlonpp5xgfrtxesppxolhuedabmw3twjjfspyoj6y@in4qkpalmuwr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <555cch3ceqlonpp5xgfrtxesppxolhuedabmw3twjjfspyoj6y@in4qkpalmuwr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QSUN7nL7-0tlB0cbWQgL5dCSSOXzJWhX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2MSBTYWx0ZWRfXzqKygK08J1jn
 z01klrEkBoWLkYLgR9NCt7bL9odvV1msZCLmAEWuFoLeaGTHsevHBXBiw4T2kszqGUkRGMMBwGn
 a+otrfBnVyAbxIQdsvLb3KzVMHX9WIk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2MSBTYWx0ZWRfX/Vb7s2Rb5G6X
 LiExY41oemILtbkcbEOu/sVQ8GL5vLP938y01+VVNdw5yCsPoVdr1hdBZ8OrSfOSKg2abKb1h00
 AosiFEHBkTzEdyutkNaKeB9XkJiBLv0T+EHgA/c2TX/4sFnUubhbs76qtoY6jJc/aWMj8ZBBNyx
 lpAnKn7AUQtpFEwEwbXIGK6p6P8LfOanmtq36jaNM/Caas4su5gR3Ri0KEVWUl67qUk7pWnS/TB
 6NkGAB5xXwnXI6b1yJ6yIFxnopHYzdexKVO6A4hIAsLN++lUNlOxH1Q8McjJXvxnZe//WSSblys
 zSxC4IgPgE+QzsVaRl6cdub+jNBpJ0Rpyi6LMR7jTVuBd0LKaOiFsaptqdbvCo4N2Yxd291uXr1
 2RJouGmmS9E8IKjk9uefjmMcdbvBniV02nuWTnQIOVG3SpsJo4dz+GXtdkg8lsE36E6PN9tiEVc
 lt1l0ejTnOig01n3Vrg==
X-Authority-Analysis: v=2.4 cv=fJ6sTpae c=1 sm=1 tr=0 ts=6acf9e5f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=Y8Q4aqK4LaMswZtuF5kA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: QSUN7nL7-0tlB0cbWQgL5dCSSOXzJWhX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140061

On 10/14/26 5:01 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 14, 2026 at 04:36:11PM +0200, Konrad Dybcio wrote:
>> On 10/14/26 4:33 PM, Dmitry Baryshkov wrote:
>>> On Wed, Oct 14, 2026 at 04:20:08PM +0200, Konrad Dybcio wrote:
>>>> On 10/14/26 4:19 PM, Dmitry Baryshkov wrote:
>>>>> On Wed, Oct 14, 2026 at 02:19:13PM +0200, Konrad Dybcio wrote:

[...]

> Ack, I missed it. The price of doing OE instead of kernel for several
> months :-D

We really need you back!

Konrad
