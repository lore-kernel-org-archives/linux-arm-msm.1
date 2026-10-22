Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792665278;
	b=QO5adc7NQF41vMLToM5KwkIZgNz+kmVfkiOCDs75T3fzW2YnmD03EpPK5nbu3Y4bcilJ
	 KU+LcMu1EtprODIDa9Kb+YiOZzkRjPY0/Gw82ilX88Hc4mWIAuRWLaAihtV5uAGBlQ9aA
	 uZirTBSnUOeVEd7rCgp9nowQoc5fUUHdWPyl71pkMuFIpdrrnydptix/xC2P1oGH4cvo4
	 1cuEYCh02diT+sC0OdXfq5/uYOcRvQQj/GSPi4AB5oo64C/V98yv9tq8JriQ1nBggruhR
	 fFyZZcJyQJrrk01NzTxAUl6dvoiU5jnhSeCIJhyrX1F45EII0mV6/v6xqA0pohR+NiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792665278;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rshDlqNejxJRqysNErHRTceLWSA4tGMQL8Av9Q+N4/4=;
	b=U7vEaH8iT9ujvRNr+ymhQDb/EsfFKJus32FOTcgrYJF5yxgluQgzH2InSLedre+WLhl8
	 iTpu9+UcMJl5qRbJhAUIHyRKaMC/q9l8qW3ea7UTuwDRizBb239UaQDtykgVFRJaVau8+
	 j48IX3gQeNPeBN59xsUh2nI02RPndRGsuKgQ7rVtM/Ys/p+u+I3b1IqiKIdhdLilPAzrx
	 jI9q5jdr0IkETNPW+Vl3qQoRiPtySyH7nrb176QKoo0AiX4C2Lwr90uPDJ5bydx6bzuxg
	 vvs1Ti4g3ne871/m63z8z9+jRkQwx1hrzR9GX9oY8sYHSYS3BOuuG1HDMIVubQEYhAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DF9e5OOz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=juehq+nP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367E1606A31D
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 10:34:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 367E1606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DF9e5OOz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=juehq+nP
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M9xmE4317704
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 10:34:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rshDlqNejxJRqysNErHRTceL
	WSA4tGMQL8Av9Q+N4/4=; b=DF9e5OOztgxDFBfoNZE41kJRB6u9wLpmPK1XzOZg
	oxLaxAl0b1ueQKf3DNODFKVFJ8MAkm4pdf8WFCJ6WjADdknDxIvm9UBMJvBBQ357
	wQky2aAKhtAsGUTPpmtY1YC6w+NuAlAfGF52yXT4fW3w4s6B/QGaQnvtcVd+7CV8
	fPykJt85SxqvASAV9tEiX0gccsQDSVFEpXg2OxuwaAcA52QCf3nwmYe9vfkKV0N1
	3r7wpiahDDm3aXpJvvDm/EJG7m2R5zmE19VnbhnZwYyg6HnBcE/E/7oWnWXjYOXA
	eWPnPkLRxjz5GnlBMnG+vqLGh7RF/+G0R6yx52GQowNn9w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93aj4x7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 10:34:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f5844e383so274524285a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 03:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792665276; x=1793270076; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rshDlqNejxJRqysNErHRTceLWSA4tGMQL8Av9Q+N4/4=;
        b=juehq+nP7MT/cbJ/3m4kgEFz/QpT4AG56cXY6ag5yN5huxsuP8TxHocCgNpB0XRnRm
         CNr47TBXY94VbFHh3VkUHQxwfsZMs0vkXNTXWjo6k9566M3nKrttfvQdAMFKu/RyQ/Ii
         Tl6iuSBNygxi9OXHbhb8Fh/FBXrDrkXQPci+MkVpnsPtoG03JBWVWQ+qzcxvY7P1V52P
         fvpIZ21lXtQ7Wl1ry8F6RO576bPTGOpVC0wd6ClLqpg0RMMP5dTAD5z/YCS+MBOhprrw
         zg2CIibAXdhDOTCORD+RzbrGjoAAwDEY1HljmUxlmYR05UlWYEYcwCR3VMJAWTJ4s746
         jr7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792665276; x=1793270076;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rshDlqNejxJRqysNErHRTceLWSA4tGMQL8Av9Q+N4/4=;
        b=RqafeoR2sjNygIjDC6SahIpdMWLaEv7JN4EKzaD6OlozFxHoaH27FtcllhRUJ7ZUBM
         i/6UCMBWIuy8fMyki4KxI0GuLyiqhuw6NJM2Okn/zluCubfbbjSP/HlmFGAQdQ4V2kf5
         XIIo5Y/6Kk56VJuqLcWgO0FwmroW4QN+f6EH4UB9LdSvu9sd/sE2KWCkH3/f7s3UqrF0
         cbie6ySZYs+OXXZ38+lRbNJ3kCrjIsBx8pecwsAaGr2njsIKH+bG6Wz2SHKORuDpx5A3
         68G5qWPSLT7wACU0cLjPzoqYTfQb5F4CUnwFhUtHDK+58/Q/G6N/tdvH2LAGmXWUrYbG
         TR2A==
X-Forwarded-Encrypted: i=1; AKwUvBxB7eslDveIx7jpMak6Yk6u7vCq9WhIxCD+6yXZcUGGLYHzxWf39Rhm/z1M/z51e/gbt9UZqrky/sB5ISfn@vger.kernel.org
X-Gm-Message-State: AFq9FYIZa1bS0TKteuD8SWGfN2zZj4scL6kMpaLT7XGAt1v6gKIs39ji
	wPDBh05hpIdM80UNlN8QOXoOFK3yM5m/j8bGP/CIU7l2VlIkjtYd+Z2ZtOezSv9hHGiXgy81ZmP
	qyBTqqG7EOn9YQjCByAkYl1RxlbY8LwhyoGAHnLbPSi4kx4z/uE63+EXpXFsVUs3wkMBF
X-Gm-Gg: AYBFou3FCNKjvZEF1JZOu3I7y7lWqVXMP5ahxLdeEv7A858cmKHKvauqvGOL8xkxtnY
	yVoQrp1nmTGGIVqJ54HVLFWemxbvxdwHL3LQ4+DseVJBAde6Vuzy/MUOoHusXAcWO/cFw9J1aEz
	WV93hZq5Iy6Fox5poL6Wn2dwlTwv/HK/WoxEgkd78uWOx2a8j+1tcz5xXlimyuJlkF694SwPJgA
	t9uNb7jMmDzX4SzwaL+fR2TbuhuUTD61NS7X6QM1Rv2t0u9t+rXB/pztk1tk8FEX2RNhT7IEPcQ
	0pL7vM+fAuI/bhRklsgXl0zm2491N5aKasrey6BOeN8j8D7VYTmFsSGFhS/oID9kQLmaYNG+sSN
	QHj78RSXKKlAHo1we/1UZq31bElSPa/k53hoiEU5MkEZPibPfZ1O0J6Hs+9u3zGRcdSerRGFPd3
	ajkxQuEH+rToqw
X-Received: by 2002:a05:620a:31a8:b0:93f:3d2e:6bdc with SMTP id af79cd13be357-93f57f05947mr842711685a.16.1792665276334;
        Thu, 22 Oct 2026 03:34:36 -0700 (PDT)
X-Received: by 2002:a05:620a:31a8:b0:93f:3d2e:6bdc with SMTP id af79cd13be357-93f57f05947mr842707685a.16.1792665275869;
        Thu, 22 Oct 2026 03:34:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa1227da6sm1020083e87.64.2026.10.22.03.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:34:34 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:34:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] arm64: dts: qcom: sm8450-hdk: add DisplayPort audio
 playback support
Message-ID: <aihlxadn6dtiskx6ge3li7h2ixmmio72zgipovlnllzjybilpl@wiwzt4dkw3gl>
References: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
 <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-1-8a189c71938c@linaro.org>
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
In-Reply-To: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-1-8a189c71938c@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MiBTYWx0ZWRfX0XUSMCzTHh6i
 co1j8sUYn+vHS96uwZdxWbtmK8GFOSeCeWNoq3EztAYOZjI/FlDT9nmVbq0lRQROgNpmZl14mXG
 TiX6o41a02st+UbKsgjgHdKNnFT1bO1ODCMR6rF14F7orMLowlgoIWo3V/jOUDfUQaH8hWTCbs+
 2aIufsVERKFw2WcU/sf6PSkNLYUtEQCC6noUaapMijvz2E3IYPfns+gDievm9RmaL0LhxOTdijR
 eVJLXR3E5PfE3Se5tMG6nBCEmTqnRWfmEi5KsrWJFWEYMYSixwew30J9lbA6NpyPPgxssJaZykj
 yc57Q1Df7cDLq/cVKA/9CZ99NsgTUcp+KRfm7pk2IIDkxmgaE8tnw4OochCmL8+0FlX5VxI2EYi
 6lDaa2hKzX1wnvIuWQx3sfzAmChK0aJqmUzHdyZV5Om1JBf8wfsa4loPJCZX1wlI19AtT8SM+34
 FLHc8tLAhsUBnQ+1YPg==
X-Authority-Analysis: v=2.4 cv=H7FOUOYi c=1 sm=1 tr=0 ts=6ad9e6bd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=DIY0J-lBf1P88TKvtt4A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ZYj-LchFSKSszZxDmgmi6owViCbB9WND
X-Proofpoint-GUID: ZYj-LchFSKSszZxDmgmi6owViCbB9WND
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MiBTYWx0ZWRfXxaPMw18sU02B
 RfZqNj6f7foi1Lo0NEn+HjWBdTxQbrhWIIIiAyjSIqs0ic+BHBSauALTOzTTXVS+RxZqUr3SCvu
 1dolCGXiTVyXfgN8ynD4fHDhYlAxyWM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220042

On Thu, Oct 22, 2026 at 11:36:21AM +0200, Neil Armstrong wrote:
> Add the DAI link needed to enable audio playback over the
> DisplayPort altmode output.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
