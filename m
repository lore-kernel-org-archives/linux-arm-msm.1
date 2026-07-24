Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA22037F307
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784887992; cv=none; b=Qi9XQUxDt7T8exQhzIiog/a55QzMfKU17MvPzXUK8dKEmqkdwKknLvxVMePN2BL3rORYdUPSCC3R/JUoK2o2UwwaLh+1b8DJiSrfZ6WVw2YEZYt6gya3OSc3xTzTB4x9ckQ4Msr5x55KPNYP/bTARRWUlg7/dxWTII+G2Ub3kEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784887992; c=relaxed/simple;
	bh=B1N4qNzJkPnYUi9FXjghrB4JZoPmIHc+q5v4wRfExDw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SNP5cWM+V+vloQ5RW7+u8Zo3oVCYjc2fvn4fm6y26fowfaJd1BsvAWMid9DV2P/yyeWOEeT6VDI4r8V1BZtVIsqPj6w1n03Kb5MPi22P+PimadVVk9MPJyh4itHqvaH0EWRzFLvm3OhXkp8aMSFH5YOe5/ozKr5gVPAmNdIw4/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jS6ANKAK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TsyWw6UL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jS6ANKAK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TsyWw6UL"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OA8FdW2877012
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:13:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HZpwT6bDnbK3JJE17/xioT/JBVGsCqg7MSbFHRT7CmY=; b=jS6ANKAKLoEElzbP
	qePk68ka4Ec1SF5wzii1TpVeycOQIN3sAWujKfIH5u9coK6EEDxHTJBIKlnRrbcB
	mrRnUQwvb85V+yUuqfzR+jeZq1H14Mx8o+39UgtgZ4QYQVBeWVKc13ylqbLhu10S
	9kSn7PSMQnGz31IuFEHVaA+7HTT1aRD2PXNhqnN+aUohIZlNXXrvDxVFFZWpvKcW
	l1b1c9pBQlWxQNL56yXz+7Hp+4f8ENmKAs3pgWfy7pZ9t1Zd1DFqw4+0IhbEWw6J
	0ws4Pc13AcqsugrEHyatxJ3mZ0kj0UTh7DRT+muqcrfhH8efV5jr0i7au9ODTAhC
	dgHSog==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm61kg0ku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:13:11 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52845bd815bso593021cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 03:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784887990; x=1785492790; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HZpwT6bDnbK3JJE17/xioT/JBVGsCqg7MSbFHRT7CmY=;
        b=TsyWw6ULfxC1Rs9mqFd8WBXdHbhqCsn52uiXG/yGoNz6dN0/ezJR6MZjVEn14YArwO
         YjK8Ay34NfXYnxMaZWSP3/JWd7yNBBRFxL4EG/OD87Tp6z2Y7na7MUTpI5hmX57zzrkx
         WJiWhpa8+wDqKOygBgbVdUC4eRvqniwtqErjUaFNCItbE+fSYCf/9gxrh18E8esKnK9L
         j6kJFVfe4HZht521WKLnYUfpxkX4psRD3vJddfVUKCxu7A0Pz9/2brS+e1x8uSJFG87+
         Ya9OXD7o56sKJaVLhxCdCMgYyg1x+ebhQYkVhO3aIWHQMquIQ+YmfugVlZdWF7L7kieT
         5OXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784887990; x=1785492790;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HZpwT6bDnbK3JJE17/xioT/JBVGsCqg7MSbFHRT7CmY=;
        b=DUer1fNE24S6FjG1OL6420ILTY3kSU4YvxFHQitF80jNhsNSjh0pANWUsY5CU5d+Y0
         s5/0u9b/6AzPXfy4vsqyKf4G9xZ2X1CBNtBvQoWjGou2sQuaUnk94aOLbisgoc2ZPJZq
         gk34B8QqEq33UAG8578lozf0Excc2DlsQI1RTFQPHfQMATQpwxwS7n4BNPaqT3VKU0jD
         9J7+IMnUIOyxsbRGBVIFiNQuqq3K1DVEInV+HNpOwaY7fDvHcNSKSPxZlcXulmTKmGHm
         SEb42slZTT1G6uMkufS3uYFzzgA4u5Vsu4d//jS0TBGBbTw7m30u8+3wcbYgdb1MxJ3E
         K1RA==
X-Forwarded-Encrypted: i=1; AHgh+Rqh9tsl/BRQgAevnqgYsrdplm8N0b2QP9DwcPkdBFRJOo2YnprajgsnhDlapFtsIFbP/zx92v2R0vmmKrxm@vger.kernel.org
X-Gm-Message-State: AOJu0YyS6P5ziLUoPA8vFRcLi0U/yQpSCtvCO22lvKXlqquQlZRfeBFI
	PeWyXO1X+G7ngXgrVl+ZfswCN7y8/DdsFQFVDMYpxNlAqGOXYEHe7S9rQorI2VThbQkvOE+dcZm
	uGKwLTrVKe4Sj60fcmDruUSj5/YQAPQ3hCuPA4N7w0mZVYV1XO6UtC/n+8SINdljl6y1S
X-Gm-Gg: AR+sD11LAwabQBWp0BfWC2bV18p+z308vqk6L8hfl58OLbTu2dvkTphi/F/Q6X+Ue8E
	uSP6N2qt7E+azcMKdWBQ9LDFXIAmNsBoXU+oZ58hFI+JwDN9U4Yt28j5C6sIw1egF3Hzqn6sKvS
	NSilTbi9oWPi50oinbyx9ss5RGqCAbryhlOSDQ4B5INVBt++MsDR37rIuzCzg7BuSLMGh+Gce0E
	ieXjEoxfYKnIp2Yuuqea5yCGyglLUU0yBSK/D17jqtJeax4vyEKu4UM3KR578za9Uc1rGnK63Zo
	6hxKPYt5dTOAXnjaS+Xkednzv1+tY/1dmkHVASzUZXD8KBi5MZI26WfN2SmwMY0SwzLBGUO/pzB
	Qx/10LmptyspZOLzyDoBS30ZN
X-Received: by 2002:a05:622a:4083:b0:51c:1c73:51a6 with SMTP id d75a77b69052e-5284972d05fmr26024101cf.5.1784887990068;
        Fri, 24 Jul 2026 03:13:10 -0700 (PDT)
X-Received: by 2002:a05:622a:4083:b0:51c:1c73:51a6 with SMTP id d75a77b69052e-5284972d05fmr26023881cf.5.1784887989691;
        Fri, 24 Jul 2026 03:13:09 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69f345b1a17sm3101960a12.5.2026.07.24.03.13.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 03:13:08 -0700 (PDT)
Message-ID: <3ca51329-d84c-4c2e-94d3-71b771103584@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 12:13:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] clk: qcom: gcc-hawi: Add support for global clock
 controller on Maili
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260724-maili_initial_clock-v3-0-45b577241c91@oss.qualcomm.com>
 <20260724-maili_initial_clock-v3-4-45b577241c91@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260724-maili_initial_clock-v3-4-45b577241c91@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: eTufpbRsSv3Tvej0LP7vYTj4v_hUcFxG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5MiBTYWx0ZWRfXxU/GbWYYm7Zz
 ULCHboaLhRHzilXYMZABzxS8TdleS+bXJnTnlEU0qwZLBqtgrXasn89oLGqiYvfX3u7xHyfURN1
 KKQK8/IUnfdnCo8u9mWHqTN8CVA3Yf8v0nLbRoxyc0bKWh7AphIILHGhXa1SbLLLqY+0TGLYCP7
 cvZc0paRqAqEIAk9q6/WHVU8PRh82KxntYO3uyrgNIOXQXuMfuwdB3OmrOWRJQdmhXvcr5fN477
 moOskDe2kudAEbe2GhiTQpyU9jb/yHE2ZrikCbWHFYwmJSoNUC/N8hUHM9qzmM9sK34m6h7+xlS
 ecdioToEZeep+JH8VcCg/Q4G8xbxyFsEjp4KlolnjB/kbHzj0bpO8GW5m/0sT3flUNV969TTCT9
 BoexYEV95MMrNsUmjhwFiv8X69Caw0QGMrIkx36Oyik5SNzF/ZWJbueXcS+YLAahekusAtf/Xkc
 qaDWJc2ZYYui0yEuKmQ==
X-Proofpoint-ORIG-GUID: eTufpbRsSv3Tvej0LP7vYTj4v_hUcFxG
X-Authority-Analysis: v=2.4 cv=JLcLdcKb c=1 sm=1 tr=0 ts=6a633ab7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=FjjYY-ANMnpf8f3CrbkA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5MiBTYWx0ZWRfX3fl6JFt2JLVY
 W2xvPVjr0BxFtc3Vu1OuImg1JL2n2UjScL1yoqrwRyA6vgP6P0AhrJQjbKxmOp0lKwRz2YB2aOL
 QlJ7FAfP43l4rQMpHjmJt+eNE1XGUnw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240092

On 7/24/26 12:10 PM, Taniya Das wrote:
> Add support for the global clock controller (GCC) on the Qualcomm Maili
> SoC by extending the Hawi global clock controller since Maili is identical
> to Hawi and has few additional clocks.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
