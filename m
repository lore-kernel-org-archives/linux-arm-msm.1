Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792751044;
	b=5pCsZNkmDKLBhQ38zBcrM8tSrCrtw7dUsTlvrMEB66V6rGnJwO78XcVcP6ZGtfKy3hLw
	 ggZYGknEWuqohSVknTNui+IfMH0KhSQp++pRzUAFVwga2KFbuUyjIHWyfKAkpwcoi4CN6
	 eOY8W/qfMzhkP3cb1oWrcARLVVyXhuThfDx6RuZ6L9e2Py1jz+R3lCmhZ93kLtBm6Ub5S
	 9k8HICaMX0INfnuxkGXXVSWcISRU3n2Uf7X+sTz3fvChwW0wRnNmY9ne02lVCPaEuu3BX
	 zqLbHpL7gqNI+Nj6I+qGDlGfAED0UYr8fjK1nl1Vezktg415snliSzq/hhev/1n/kQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792751044;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AB1BQQvVTkQHNjM+5OSNHokWQOtdwlR/NDdlUhu12m0=;
	b=0X5oMiK6C6qPvtcVWngbQQGJdcWZXPbN7ICn6Yqa7bCqjETtv96E9/RWacGEKuykH7qQ
	 IXMj9KOr5JZ395IvWe2m9UiXGcAQNzVQ/RqYwfyXylGreIiAjrZx+qjhGBpxb4XXa3lD8
	 vJUViyUXkbtK1Dt9fzPdSqo0bwkdcn+5tzOFkIFaxuN0A26Pp8/KJs8U/pyITDaZD6mc8
	 UxDnPNe06crlLJey/MDO5byYRUA/ShshbMVQGy//QJusBoAjkafji2j8v5H1wJP1u6yFD
	 yxMUfFvPeOqZ+s5VjfsLuCPS5G9tU3s39ihwtZhD1jAty3XKPO9r92Unuo9eI2f0qqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k6fcnEVF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AYSjHGAw;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474FD606A31B
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 10:24:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 474FD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k6fcnEVF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AYSjHGAw
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAVIV2164269
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 10:24:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AB1BQQvVTkQHNjM+5OSNHokWQOtdwlR/NDdlUhu12m0=; b=k6fcnEVFqKFqohpu
	26hkUttDEURZCKKo3dqJ/CGgx8kw7R0zM/0d2FdEZSi7r+zGMS/s9YUn2mSomQnf
	iWl3hJJHL7UMsfuzWzK8ILQ6cWQVsNFLNjeVp6PLqvzRkJqJcwPZ+CuNLnjsDc0U
	bmCobvZOP75/U/b0J/ryfHEh18Zr/8TNZe3zEV9KWtt8R6wqlaL46bjZZhdLosEb
	Gtbk9wT7fklnZg9bF3JdbwA7SiPP/H8gsOLnkfAy2oKK/iGeECt3wZyHtgLprzU1
	Wvr1qb8FnxlNpUS1MB7MxI3kzoXsl7kYv/F0wx66rTuX7fzt1Dup8W42Z2oDFWTI
	jXdOmQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfpahun9j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 10:24:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2bdebfc5so18698185a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 03:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792751042; x=1793355842; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AB1BQQvVTkQHNjM+5OSNHokWQOtdwlR/NDdlUhu12m0=;
        b=AYSjHGAwTqMqfuHFa+2iIy+hQI/Ym+fvYlpp1uDkZVf5Pf5fJin8tEp7Um5GtONPp1
         yXOWwLi3V9ESqlVQe7z0ablVcnQm7ObB9B/Ds84/HxRxLWAaTAWfxNLjlOjrHzY1bWmj
         HDGhjvxmX2FHwLto2DMNp+v4hdczvr7TeXu+J3dCxHhTnaoZAwTMA+mikl2vhOgqZUaK
         MOXcFvPUZHNQp0VfRVPdMLTpkBbPRz4xRNdmgYGNk48leQTbpkH/7aUB2CKEsBCs1Ew5
         edjnQqPMrqco0J38z8pVWfTxjb8Sn0urXzAQoFKXior970Nl3IeSoso7wPT/2K/rpI4a
         4CzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792751042; x=1793355842;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AB1BQQvVTkQHNjM+5OSNHokWQOtdwlR/NDdlUhu12m0=;
        b=AuaLG8yFtQC0hrHeu0F/6+IVps+0DLJuQVtkBRRHOjRTNpKvt3nUM//GhMwjkvxUGq
         S33J4i/W9IngUboKkt2WNLPY2p3Wg5eI8gy6ahaggCCELVH+DrT84yV40D+NlgF4d10P
         fAS0aEJILTBNoJxaKmvbDHb9aR+A5phfeAUhU6rRMp7y7H4HNbkejY2l10CIxKS8TgdN
         803O/8pMqvdB1XSev3IHEaNjatUbzyK4FfNKNWWJ2ZLvovKL5L9fzylmWKpi2+X1ns0+
         ZpBWnm4SSXNsYRtYLPbx1zVrMpQjVEKnsVmPVLs5nQyE36FNUvmyDHCcnBtDz5HGEt2I
         J2Rg==
X-Forwarded-Encrypted: i=1; AKwUvBzY4NEfA/jEfsBhfUHMTZkUuaBOcpYepGmUeaxaBwGNfqsiwLjwMwGXbAnB4GSS/R3f9L2RfDK/YrABW/7r@vger.kernel.org
X-Gm-Message-State: AFq9FYJvqrXLu7kJVbZPgfI9MEbFt6eTWPcR7ubwpqYJX1Bu8bL1dBPQ
	Mtcih7FqnexJVW8zOm00ynsEB2ho3RXJiQ8LysJ16+SZAJQ5p5QQS4UDvWSnE9oxCKFuuz4h2CE
	mmomaoKdvy5JwIqwik9Pwe/RFBUgR+D4wXwrPtXcVCILpNKpPk2+IIEEgK9ABJleg85YcsDBepE
	pg
X-Gm-Gg: AYBFou1YR7ruEMfw5ngrA6XhsaXiuzK2jg8z/mQy95BaS9P7xuM4/41wPd90iJXUeRp
	Es2soUaCpKocwecNWW4k71jVD+e/Fi/jLH8okd6dd84JgDaiguDqPM0/EMJnt89JZqmMWDX/539
	NNVA2D3t9O5DsxXKSIVjFeW57dBcRri9RR4pJxdFHL+mloSt50vSf5vR3GFfqMsDp50j3zxm31t
	sqcwhn+5lIJQPPKmShEEhhblM99S1NeufEGpZkhUJPSDzrMT6HTKCSUnWOxE+Ek/N+th2wZo7xK
	4gYFvivFuRNPmAeWhAhUQQ9ku1BQu8pq7NBBCsOvA9uf+qz+iO07E0PARpjdVA7yNggzpi7pHcn
	N8guSdnn3Ve6bgiDkaYp3Zw==
X-Received: by 2002:ae9:e208:0:b0:93e:e111:2771 with SMTP id af79cd13be357-93f6f7c51c8mr345314685a.2.1792751042449;
        Fri, 23 Oct 2026 03:24:02 -0700 (PDT)
X-Received: by 2002:ae9:e208:0:b0:93e:e111:2771 with SMTP id af79cd13be357-93f6f7c51c8mr345311285a.2.1792751041992;
        Fri, 23 Oct 2026 03:24:01 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5cb7fc6sm86648666b.51.2026.10.23.03.23.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 03:24:01 -0700 (PDT)
Message-ID: <de3e5baf-dab5-417b-a9ed-225cbc56ce1a@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:23:59 +0200
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
Subject: Re: [PATCH v1 1/2] phy: qcom: qmp-combo: Add PM suspend/resume
 callbacks
To: Prashanth K <prashanth.k@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261022104321.306679-1-prashanth.k@oss.qualcomm.com>
 <20261022104321.306679-2-prashanth.k@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261022104321.306679-2-prashanth.k@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA0MCBTYWx0ZWRfX/uSecM9fIsQ1
 K+6Ep9NJv0npSGlxgbpj6hppOMrAHvFWnvsmc17Pu19jOA3OUDWGyEpNNaF11NyB2U8vtiRHPGX
 RwB7Wzu5ybyQi3x0YBJkPIhgR4+KTr8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA0MCBTYWx0ZWRfX79Rs+B6QUQaZ
 hFhikd5CS0mzyyvaQNJuYeH6ds5I0avGN0SHu+hdDrj3OvyrVfzySibfYl0cJyf/uiY+ki9uviT
 E8CS0Kcv73t56J0wMsRIA+JYRyyZlrg1sG73lgKAhnkAAhzl+mZKzDangdKLgFhxvAE9Vop4KT7
 X82pPunx0Jmr7eiUZmEYbIsI1kAbcGrx6MlMeabR85oWZMgPVn/L7Ouu1MXJxW/Bz0Gb6g5Ypkj
 DSexCQhyT472ouq0hwr+6tGpxJ6YxX6EifnBXHxiN+KBxJ6Sr29PWmr0x6/RarlprYMJGvbnELl
 OHjouQOwRT13y9ooU0etwAOYSqqOcXt4bBvIMvWZa/sV7G4RzQDGpqA2lElKZQC0tNMXmXkpWv1
 62wLCrErULivg4wy20Qv6faJ+zqnFwLpuxYEgXsQAjQnDSWY3xzMs7iCi0yGxSiihm2azTvuUzW
 vCBstW6031W+uFzunFA==
X-Proofpoint-GUID: MlohDlonxIf7OAEns470xPgwqgX2h5Q7
X-Authority-Analysis: v=2.4 cv=YIMKWhGx c=1 sm=1 tr=0 ts=6adb35c3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=fBNUL6i4Ua7AmJppQHsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: MlohDlonxIf7OAEns470xPgwqgX2h5Q7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230040

On 10/22/26 12:43 PM, Prashanth K wrote:
> Currently when we perform system suspend, the phy clocks aren't
> turned off leading to power leakage. Prevent this by adding PM
> suspend/resume callbacks for the qmp-combo-phy which toggles
> clocks on/off correspondingly.
> 
> Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
> ---

Well this still leaves pm_runtime_forbid() in the probe function..

>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index c39ced168d03..f624195c9b84 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -4463,9 +4463,26 @@ static int __maybe_unused qmp_combo_runtime_resume(struct device *dev)
>  	return 0;
>  }
>  
> +static int __maybe_unused qmp_combo_pm_suspend(struct device *dev)
> +{
> +	if (pm_runtime_suspended(dev))
> +		return 0;
> +
> +	return qmp_combo_runtime_suspend(dev);
> +}
> +
> +static int __maybe_unused qmp_combo_pm_resume(struct device *dev)
> +{
> +	if (pm_runtime_suspended(dev))
> +		return 0;
> +
> +	return qmp_combo_runtime_resume(dev);
> +}
> +
>  static const struct dev_pm_ops qmp_combo_pm_ops = {
>  	SET_RUNTIME_PM_OPS(qmp_combo_runtime_suspend,
>  			   qmp_combo_runtime_resume, NULL)
> +	SET_SYSTEM_SLEEP_PM_OPS(qmp_combo_pm_suspend, qmp_combo_pm_resume)

You can instead do

+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)

and as a related fix, we should probably throw a mutex guard into the
runtime pm functions

Konrad
