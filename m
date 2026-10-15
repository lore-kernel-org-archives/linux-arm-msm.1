Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311914AA402
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 08:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792051251; cv=none; b=a7vDU7+yQzOA+YxmDzvncMhjI1ABviyeMMzuvffLYNzDuIl+qTxyUhhl5UdFx6/iIc66N2zuqalLudTg1cKDsNRltFYkifkAFEtTIIRe1cyieFV1sLlre8qL6HunS60eoP01hdtzE7QShp0Fbz4Cz7sobZEiPqBvTajqkd9tEJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792051251; c=relaxed/simple;
	bh=jiuVxvfeOFKBW07dTGQjnqjOJvsrBDeq6N7/q0zwQbY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RBtU7gQ9WS/qtpOYxpLQnuR/FJ04SyPpiZ1ipTLDT24V1RYNxiGKa2P8RggOiKWP9SNBmUe505yPYf6sBoK0MktxZAzVLdJ4Ysfyq1kiUMLfglc1LEVVjqunOId4T9INV4sloMcneY4YJCIWB/jzRwZrbNpdWQyShtb0fyfQO8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TZVGxHaf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JRuqnAsj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TZVGxHaf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JRuqnAsj"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F7651H1672232
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 08:00:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LxDwWB+d/4qs5ZdRVGstKgvciW+mNZiI7MJTnjESahA=; b=TZVGxHafBuAaCKlR
	fIEcVLo57zngkTkrtOjKIQgD8YlI6MjjtvMGagK903C1Os266Cyx4X7VgV0M9JqM
	czYsGiCV6REm5c7XIVGw/J7h7UKakh/1ysEBxho8zUqdpokFgNOqsePemujQFlcR
	loI2I6UcLiRXhLdHk2T1ITNRJO4WQxgCfJrCE9M4qC/bBsxEbKMUUKpjLjqPQMjF
	FpLWpFB2dg0odmzNiNmRrXCw065bFmN3QWR87gA9uS4WgusqpKkzbD0gL8KB0+/Q
	LlnyXGoQ0YKh/bipl3G1MzsYOXJh9ssOD1pMrYZ1lqJtoy/y3I6wXvK1VlxfnaKh
	jVp9Ew==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hacrhb8wn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 08:00:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5356c6d98cbso14005191cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 01:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792051248; x=1792656048; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LxDwWB+d/4qs5ZdRVGstKgvciW+mNZiI7MJTnjESahA=;
        b=JRuqnAsjIx4iJ71uVF5Xzpr7WxqUgHg5iZuNLSOO+wb4MC3FpS3CxJGmq7CPR+IWCj
         Aw1TNprb89C3LVIGcCysb/NfFxsxw0X6FUzPi5w8ZFgJO5zQio30qHu0VIdE+HGaD1gW
         yZZrJh3bpqt2Q3f1iIMSWf08y9qqw5U9q8BmIhf95JBgL8nVHzcngqA7epzB85V8OGWX
         wZcC+XvB2gJC8HD0kakNSptcabQOA8WvtPDa6osIJZ5XGhQivONM5w9uOmwvcNcD5BQW
         zFgXw2lO9mLcYl3ntOu+ZGFRj2nC2NFzJUct8BhaLgvG1LABm6ry6jFtv0C90mS9b+uW
         A+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792051248; x=1792656048;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LxDwWB+d/4qs5ZdRVGstKgvciW+mNZiI7MJTnjESahA=;
        b=Fz3SBZcocc5urJr/d8MHTF0PjD10BuVXURafK1Hp5jceAswaxEomhjjxapweGTSfoG
         jGS1AY3hoDeTObNAnCqMS6KHDiS2CLbhFxwfOBMSsQimLmNCqB9G1sWK1B7ahKjat0Fj
         CQR9ua174+mDN32sSshokqNAfTG82dPZUiirtpgtUHsE3Q/3ptaKLcj5sdSrJZ2iWUAK
         jvdQE082WuKBy/zG7XI9aJ7XfOyy5n/Kaf58aOzlnQQ2hvRNK31qKU2vPRGIiRh0EV7W
         x1Ppz3Xh9lfB5B+eR4lybXKiWfJNzy9PMEdiyIz6oweK4xHQ5xDPlKc//+z2FtNAK9/3
         SZtA==
X-Forwarded-Encrypted: i=1; AKwUvBx42P2C07FIxfzIKwT136jRPiu86HKfH/prY0r7Z0dGFtd5DjjsgCNjtiDS5yPZIBsm71B46tO+WryivF2M@vger.kernel.org
X-Gm-Message-State: AFq9FYKYFJwzPOdq7Nx/rj2KyzB49F/ZDNPiLlNu0sA9qqoD1L6mKXW/
	tmqpmIKJheFqYAdwzQVwhCZSdXsGIe4nS+GwhZxZQ5LQ2RBENropCcvuW9wQ5D4rs05NXbXlP2r
	4miQqJKaX2zZa15cAnG9kH+KgRThylDVvby7GJp1OBDA6dnjKg5cMbr/ycuz1iLGpS8kC
X-Gm-Gg: AYBFou0+hdLrK/BUNN2pltHitwuz84IGG/c4/DlhPCj/Z6OqHg/wTHuF3s5RGU+9mt1
	BStT/1WtnEfWpXKo5UqEY9+CutSQ7Yz1Djw8fJHiC1NL/zFRs0usVC/bj4veZOV4jE7H82ZvQdd
	Z2+qmH9hnza4fAzN+YjLqMrvhDusKJlrDHO56FZY0RPPG9mjRkPVXu0ERwKpADzjfZ69c7B50Hc
	8DXZaa43012zERH7QnJSYE8HKDLZP1W3jFZucNRfwFUEgi2RDu+0/maehPszw6NtTq936RzhKs8
	Hl3pviFJaH1ik4OJ/Bi9oYWqtGsg2IjdZCJy0t4HotghY7MxuMzkoB0MNu3n9gKy4dY7xnAwR6b
	P6l3lUnlq6vBvW2sxzrL33w==
X-Received: by 2002:ac8:59c6:0:b0:51c:2324:666 with SMTP id d75a77b69052e-5359fa50f67mr350338141cf.3.1792051248013;
        Thu, 15 Oct 2026 01:00:48 -0700 (PDT)
X-Received: by 2002:ac8:59c6:0:b0:51c:2324:666 with SMTP id d75a77b69052e-5359fa50f67mr350336971cf.3.1792051247255;
        Thu, 15 Oct 2026 01:00:47 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda044aabsm91788766b.57.2026.10.15.01.00.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 01:00:46 -0700 (PDT)
Message-ID: <2f296811-cdf7-4f87-84f6-3561cabfafed@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 10:00:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] arm64: dts: qcom: kodiak: Make the ADSP remote
 heap no-map
To: Jianping Li <jianping.li@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com
References: <20261015071511.977-1-jianping.li@oss.qualcomm.com>
 <20261015071511.977-2-jianping.li@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015071511.977-2-jianping.li@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: oiDqYGuNcqD1LpkUNaqhkB_PhIaj8n8o
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzMSBTYWx0ZWRfX9fKBM0CVk4mF
 A6e8Bo/KNkbTckwvR5D3l9tfzvqQMZay0RFNeZk7jExALcKQPQ5hJRArXmsHI94tHmx0f0kJXx2
 aQkdN7Nfc0WZQ83SlehSoOJC4dkAUKY=
X-Proofpoint-GUID: oiDqYGuNcqD1LpkUNaqhkB_PhIaj8n8o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzMSBTYWx0ZWRfX6ZZt127iYTaa
 HaQrFdcX8O0aG9IUyNdhQFuOBUfNjC5h19p8zX9oGlNgF/ks3l4CefygWl+wk4HMKyRGjkREOfP
 1pmbR8F46aP/3Jv92gSmmyO1sTEJE8H9EIU51hz9bDfyo6gekLtYPmjQ+AP19K5hW2e3rMDl2Uu
 FPQNK+YLhvwuF72Av43TzsUwFZrF96IKJ4u0WUIOy3WhSL4lskG0b3CPNavvX21ENSiBCC+RANH
 r4sWbacpY3h6BfO2vYy5GK87Kaduk+33v5mCdsMR8ykslFdGmsID+m93BjQPPvi3D27wUr64Qo4
 O32P7CyZ1/dVmlqHIqwNB7sKoHcHvT/NOcMqq1rcBgqxbCCkGRVjN0JDG9Dq+/Rb7ODa1glVGOR
 GsR7QHgmu2P0nwd6oEQYucgyzn9n8/Aj/Pl9RNylWphcZieW4rWdQ4FA66tCawm+FypdLXlr7JK
 0eL2ir8HUqHLwEBQ4iA==
X-Authority-Analysis: v=2.4 cv=SYZi5fRu c=1 sm=1 tr=0 ts=6ad08831 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=yc9GWqZudGba39dWNLEA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150031

On 10/15/26 9:15 AM, Jianping Li wrote:
> The ADSP remote heap is declared as a reusable CMA pool. FastRPC
> assigns the entire region to the DSP through qcom_scm_assign_mem()
> during probe without allocating the pages from CMA. Consequently,
> the pages remain available for movable HLOS allocations even after
> HLOS access to the region has been revoked.
> 
> On Kodiak, a synchronous external abort was reported during storage
> testing when the kernel accessed memory within the ADSP remote heap.
> The faulting address was outside the HLOS stage-2 mapping.
> 
> Replace reusable with no-map to prevent the region from being reused
> for normal kernel allocations and exclude it from the kernel's
> standard memory mapping.
> 
> Fixes: 9d7d847ff1c50 ("arm64: dts: qcom: kodiak: avoid EFI overlap for ADSP remote heap")
> Link: https://lore.kernel.org/all/20260423063502.484-1-jianping.li@oss.qualcomm.com/
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
