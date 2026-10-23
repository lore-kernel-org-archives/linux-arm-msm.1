Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792723635;
	b=WqvlHJf3ckRqgytfHCPkQFuwpKXSrzCytb1Bvx75qd5/QwFvFOoCxKnxmnAhI25KFTfK
	 zTdOKkWC5fVXRR0Tl4IFdhodPvRUyCDwZHz/L9miAozJi5G5CF72lYQBaNfbWO7jpBIPL
	 C2vCTLnM0YVEUdJP9qe43kIxyxovQqb9jbzNJ7nQ530tkd+bhI1Yw9PEEhtesXXcmEv5r
	 rWONPCYH0o6i3QBvuKxgEuZ9WDA/Il0K7EGwiLyay/L+WWZoT38xqK9lGaOoSz1Q7Lnu8
	 4aOBaNegi8fFDF+vso7MvM0j/praPiCRAkIFKSKdVCRLm1o/FIDx9wC1ceS+9CVd0fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792723635;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qzkcBMxdB0AgfLpu2YLCDsMP/8JIkwWl1aJT9/SZT4o=;
	b=na7kpGzsUK0IP8UxwEzFK5VGpY/hU6k1CU9CCPR6BqwiNjCAdVbAWQIB1ZXsH4FR4HPS
	 bIBv6VeV29pS8bhnmQ1MLI1LA5GZAulPCp8vCdWAyXBmS9jMk3px/HJ+GIovUhs4OLoUs
	 1p+kLt6EmP+69SW/LtLHMCp8e0ROfy6UJ7jCCj1U/DYbBP6gZJmWwQl/IdSwSb7Vb6x5f
	 bvIteOy/fDHkDmu5PHLHFfvXL5AWsiOhg/R8icmr6aLlibYydK99XEa1rImzguULbPQhF
	 p2s9Lj2tg/JR/NbWtN8hjOIlU+WVPYaqElqLk1wKg8U53TO3UxTumBUWwTBkF7iu5vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T77eDZvy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="T/6sZM55";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F270606A31A
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 02:47:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F270606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T77eDZvy;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T/6sZM55
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1F9hJ425693
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 02:47:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qzkcBMxdB0AgfLpu2YLCDsMP
	/8JIkwWl1aJT9/SZT4o=; b=T77eDZvyacg2/0VU57iAnPJXV5NrUeliWvH1hTnb
	Frb56x5WfoT31b/pPVtODsxU4IS49TQJbCBwAXMJ80qLUqXTEEMlRxgoC78FWD7b
	umRRcUrt3ZbGZOLz6ub+7Ac+8kqTkKaz+GRuQG4Ak3+9ScBxA1wZJqy9FOZkWqUC
	TXLIJaU5E9mHgMhvUasPKzk0ACEfzvY1bf/IHkRjAQkr0NjAr7D0sEPWS3xXqEET
	jpJZSqscTjcdAerR8HKFmzYtuC/63mahdzFokgtnv2SZCGL4iaQ4ypas4XoSSnXV
	LLregcLCl1FYXo1PBKE+MfaEnBuLcPIc12y1n4/+kbOMQQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqms1guf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 02:47:14 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3580c07911eso1289638eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 19:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792723634; x=1793328434; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qzkcBMxdB0AgfLpu2YLCDsMP/8JIkwWl1aJT9/SZT4o=;
        b=T/6sZM55To7DlbG4liHHfkiM1enTifjrdmyO9jdLiROJFqdeQHwUTE9ACt3cCBGcty
         NF4ruU7XnKleR2W5KE57pv2jmQLzg+xKBlKqQdM9RXbxzDLhoZE1juJGegWRTnT9E85e
         zQykmxDYaGVGCtYb6+KWN1N/2hTlHly6+9XTunrjaZDNjL/sNUh8QTFVVK7von7VDfal
         6TwFz7sLoh1uHY5SeEB4uxGzYZLi1Dyn05leUKTKOaRnW3ZnLvHtRWG7gdCyeCGiEIaV
         tduFoZYTF7VCLNVkTanlgFjJBJC5fuprS4N7zJUiKFwDw+nh0MfU7NlqDo2r9dzeyyrp
         bQjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792723634; x=1793328434;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qzkcBMxdB0AgfLpu2YLCDsMP/8JIkwWl1aJT9/SZT4o=;
        b=EcqcQ8un4K33naAg4Ta8uIWwZVhYhwbgY/AxvrimWmkDlLd33WlKd8gX8mxXEZR01O
         JdetZHvleZkYCRjoJq0mwBxglWZUaAl97OnQMeWnZn/j5ZUmxggEW832WoRTZkLJhGEJ
         M+86aW2pvZpdu1PmgBtwOHb6bD2/DEhpdv5+OdeuDQqlXLeignIao4irYxOirAoHs6zs
         Tp1vDOOicrVk2w6mrKWokJSLOZckYsbx45rbQ7As2I5mDPoenHDRaf+z3Z/Hxv2uCNaE
         MpwOvDe4iRhMnKkZJKAJxMx5ro6oLYUubbl+/HYdaIVek7Qd7nVwlpIqynnxPPAao7h0
         bDrA==
X-Forwarded-Encrypted: i=1; AKwUvBxiMNkCnR23qlfFfizUzwFK6XvEn1nMfjtf7zTYuaCv5Muh1nkbmz/SvBG3lIhlDgRaBY2F579dVw5mqQdi@vger.kernel.org
X-Gm-Message-State: AFq9FYJWhseeiw+qsnZ2G47E4XqAGLxutl31u38ypaVvX2bpOWZ0m+lA
	uJfDSlilwnAI6/FCyfVCvJAegdfuq8GXT7EUxDpQi3bBRux7dKZhRvct8MXgysW9ohpixKsXCw3
	1uBuzrvj1f8CQQ47chPRDVEiPMBRqQKFj/NqUjS0nXDfOgBoKeGUXWyfjhmRd2qTiMwHn
X-Gm-Gg: AYBFou3xTfSSDXSgK+kVDBoRzJ0QGlzKhAfgyJf8nd2bOTxbGbgg34iw93amIRyz7lC
	0s9+atfqzD8mZJ/JKcBx3HtGtaRShkrtG0fAHTU5MrpuVrcS3pIPvRH6D6nKJgD8ROzWPWODnd9
	OKK1fSlAQZFT8PMg4Sl/sQS63qvXBYNGJMVmt4HJVgxBpfkedvBYngU1NnY6i7gYnreDhwHKaWY
	bb4BkcevAmASoqQ3NGo8QsZlNRk34KCQYAWug4P8eD4sNsUVW8nwsyYS6NWP7v6EKtOzUAzqKkz
	ddYP8L/PcR3+gU7OEPD3LjY57bgehS/GvuU20BtVGWKZhMBDpyxlkqs0GhfEYmQQERXn5uiCQLp
	mahdlm/dzYNd1pEg941ErzU0eItrpe1pOH4PX6WfTcw==
X-Received: by 2002:a05:693c:41d7:20b0:366:913f:4d27 with SMTP id 5a478bee46e88-369d9815875mr1237558eec.30.1792723633826;
        Thu, 22 Oct 2026 19:47:13 -0700 (PDT)
X-Received: by 2002:a05:693c:41d7:20b0:366:913f:4d27 with SMTP id 5a478bee46e88-369d9815875mr1237538eec.30.1792723633344;
        Thu, 22 Oct 2026 19:47:13 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9d5ea18sm2727851eec.6.2026.10.22.19.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 19:47:13 -0700 (PDT)
Date: Fri, 23 Oct 2026 10:47:07 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH RFC v3 3/3] arm64: dts: qcom: nord: Add SoCCP on
 Ride-Embedded board
Message-ID: <atrKqxb0DgExzYPl@QCOM-aGQu4IUr3Y>
References: <20261022-nord-soccp-dt-v3-0-1a69a4d54c42@oss.qualcomm.com>
 <20261022-nord-soccp-dt-v3-3-1a69a4d54c42@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022-nord-soccp-dt-v3-3-1a69a4d54c42@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAxMCBTYWx0ZWRfX0cMuSWtYNC3B
 LfqYmnOnAgjF1cf1x2cMWTjZRG9Kb8FGh4G8EAH5SIjz91M0zEI6dXn83zTWlL7gTz2CAHRULgB
 OcwNklUZyWsMcQNuzRRCzRr32n3l2kPLnqNv6dm0WM6iXxXxEcYcYHfWigUTv7LRewTchehpxEr
 KUkCQBd4Ls9v7+luhJvj5m2UdRl5lb6MwdRiz2G0VRUptq986qVWU6dyhW0kNGOaBOfSSdhOY//
 +cdDSAokfL6sNW6Vk73pIevqYwGjUvDJkE9XXMeMzBiLkKivIxSTFJveu3GLwNHSHtzwcyIdvbo
 EdMaeExP1TCmzb/IE0wfn8T+1jKzrieWMNd/FMFN4WghlR8xQXw1vDOarQGvDK+Dj2DwU8x2nAS
 OjHOZ/8FnOrW4hkMxc7CC6Ev7HMG39fLZDA8nNv9SyDc1PdiDBSQ33PIFDTWS2bBrs9hOsDUt7d
 h7dc9WI23aDXdDNQyoQ==
X-Proofpoint-GUID: D-_MJO1AUizHIUUr4qYMpCogZi_yL3wj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAxMCBTYWx0ZWRfX8Djv+7TFy92T
 /LzJyWbY9emlleo9/fhYjk8I+WaBXw+XCTMnkoCHfKnx/yc8o4qgBFAdT4GfzRqijghn4UUzQhl
 Ry4I5Jn5az2vPltxTyCzZgpe8o+zDJI=
X-Authority-Analysis: v=2.4 cv=UdbE26SN c=1 sm=1 tr=0 ts=6adacab2 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=YweHfVvRe2V-vmamJHMA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: D-_MJO1AUizHIUUr4qYMpCogZi_yL3wj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230010

On Thu, Oct 22, 2026 at 05:27:03PM +0530, Anurag Pateriya wrote:
> Add the SoCCP remoteproc node with its firmware path on the Nord
> Ride Embedded board.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
