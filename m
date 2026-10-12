Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1BF47141C
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 09:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791795655; cv=none; b=aBrGaCo2JTsCHG9YZKWXqmU0fyMoUAvIeC+1hxaI37oJiFky7PkvioOoEhoF0X+8PmoXKkMk49IsPAUypWbA3MJRFIM85RlTuc488WmbuBAoS9qpDG11qSLuw+JKbRxTVBXkP2llDEfvnfaDB7dfM8wiDeWo13pXeGz5nekYkqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791795655; c=relaxed/simple;
	bh=nIZ7aPC8El9/T1BdF9i5BoNIixGWbL4Oy3RPBNeGUHg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tW5hPLKO4yod4mCF3iGOvaxS9Eak4ZQ/ScCG9E7dYXo95A5oY/JP2UOvH+lsGR+1QUqvegyw4DrfTi8UBn5LpxvZu+nB2zuN2MxgodRaY8dLXl1OKO75upLfgSExzCFQR+3l3NJ5Fz00qVksUWDgA8fzTw62oONlmf8duPYufgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ChNDmxN/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YhTGoFay; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ChNDmxN/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YhTGoFay"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8KbNI2873944
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 09:00:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nIZ7aPC8El9/T1BdF9i5BoNIixGWbL4Oy3RPBNeGUHg=; b=ChNDmxN/poNfNEJD
	ncPvnzQlPVkG+T8Gn0BwBHidO8EHW40n0TkNWBujAkYIuHsJbYQS6WojfODJnj27
	iY3ugcHRVeD3muaoqjvQT4ZUbt/SPUTwGgkjh++cAnC1jfHLW2fGqZw+5Y0fW3Jk
	Yw7wOttSPZjYyUoSpcC55Y24RNY/prLI/zCbW65I1sX6uOYsrlP/cbg98xQZzRit
	nKNeiIdDIqUR4+7WTrS5YXBZWeP9xYPRYlZlUdUeONFfDNU7/ddy+zeOkQnZiGYQ
	9rM6/cwmdmGM1TBR4dBefDC5XHDJ158BhKc4Jap0kxNfpb6UN63X0o7SyDCee0RY
	YuStqg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7b2fe37e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 09:00:53 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-351788121cfso3918434eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 02:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791795653; x=1792400453; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nIZ7aPC8El9/T1BdF9i5BoNIixGWbL4Oy3RPBNeGUHg=;
        b=YhTGoFayXjG9gYtgl7NzDtPB2lpkqd81uVB7/UI55LKonia/t7/Qb/m6LfyxMVtNxc
         4EtIZJrBiRT5PBufhrqy5XXCVjlLB8QYT5AgCKlSoiUoXLIwZtU4Fs0h34eZo8zuleeZ
         66qpEWboWzisFNfZ5ZL+y9ZliyBNUPrsdJJCvlZfxPW6DBqhOF2zD1t3xyoMZMc3NIcE
         8y8PFCQz/ApjDGCprNHAV5V40KX9zlhlXQX1F/gGpdnNSNpAzmpXWaiBVuAyXanH0W80
         rnE734zIvB+FJvHz0CsPdl/rB16F4WyirpF3MPGsxetmBcyamUpL86I86n1OVFIYRlew
         MESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791795653; x=1792400453;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nIZ7aPC8El9/T1BdF9i5BoNIixGWbL4Oy3RPBNeGUHg=;
        b=ojSbDVzGJZKGGbWxPbiaCFYXUyQ7Z9Xx9jy4+paT9ULlvfPWTTgi/WoxlWHg+NBM8l
         CzMHv0Iq+wTwvAK6SQRecDoa9/+dZiJckIDmQEtMbN2A4X9AfCBqPkn12Tm6Itn74g8G
         H2HT20xYHP+rsckZeye4FW7idrpsORgOwSnGKMUnPNokec4ahGAebg4zp7o9fJRT1v7q
         CX0HpibJEOJlxn/NpivPVtZcPXGyPLmd/zIrB7Z310r4uEqw4hx00offBsm96orj4PPr
         uhiMdZ485380slI4fEG860xY2k7bnLUqHJSA3S8xE2j2UOhUuVJG9TFTaWRSHWIJfWO4
         BegA==
X-Forwarded-Encrypted: i=1; AKwUvBzdT38FDDSjH2ILr78cJN8NPYs3AhDh4PGAxULTDQOifCncQhyo3ZJEf2tUnlVsT46gdR2iQzVfwx4lrCHm@vger.kernel.org
X-Gm-Message-State: AFq9FYLgn9FOw18EpU19LFWI1OQj8eBq61q5ABne1fLiK7foAZn6+Sh+
	yA5djaMstBGDc0PLDz+Y3ZSOUmKMaPwpWL8/Jx9XaXLo4NGSCjMn9N77/xpeQ505+48c1XNcdmZ
	AZseobwrCU8SrqcCOVGg8K1s22zILEDq/0CHo0Rk0IX8FVWNQQFPtsrBSiuAVwW7Wo+8x
X-Gm-Gg: AYBFou1wplJXdB3UvPPTPCNtvKHSpgTSmVEcV+B1IlHjjKh+9abpzgfpXZ1g50w+uSZ
	JKWPya4erRgH6trIoph5hq27esyVA1noweN/qfdrWnaZa7GcRLo2efOrePfTuogecR3AQCdS5jn
	4fhXXbcJ+oFI3ZdKm638BccIKL9CBAlVJcuVYkZ2QGdlhISog+LtZEE27o5/A4boK3l+ibdUivS
	tdZDbdIxjqfQyeab4a/1lEqmHosURZ5NfuiD6njG6gCq0UYAmP4kCOk4lG2TGsHrB7dUIRbaxMW
	cLszr3mOBEuVDCE87RT12Tiv6I9kRJC04stzUt3Edh1gYpZxnt/Kyk+ClNZ1614TX+qhozY8YJn
	l7D4kw2WNU1Qr+V78bg==
X-Received: by 2002:a05:7300:fa15:b0:35b:9851:a896 with SMTP id 5a478bee46e88-35b9851ab64mr417257eec.10.1791795652395;
        Mon, 12 Oct 2026 02:00:52 -0700 (PDT)
X-Received: by 2002:a05:7300:fa15:b0:35b:9851:a896 with SMTP id 5a478bee46e88-35b9851ab64mr417226eec.10.1791795651874;
        Mon, 12 Oct 2026 02:00:51 -0700 (PDT)
Received: from localhost ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb1e05esm32288736eec.25.2026.10.12.02.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 02:00:51 -0700 (PDT)
From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        prasad.kumpatla@oss.qualcomm.com
Subject: Re: [PATCH v10 2/2] clk: qcom: Add LPASS VA CSR heartbeat pulse clock
Date: Mon, 12 Oct 2026 14:30:48 +0530
Message-Id: <20261012090048.2495379-1-sarath.ganapathiraju@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261005060630.3323963-1-ajay.nandam@oss.qualcomm.com>
References: <20260930-master-v10-0-105207bc5275@oss.qualcomm.com> <20260930-master-v10-2-105207bc5275@oss.qualcomm.com> <20261005060630.3323963-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzNSBTYWx0ZWRfX7luBbvi/A6P9
 42T9o18XvtSFT7P9PPDNssVPrigW03qPT+ZEOGcRIK2mpkbbw7JY7sP2IlRuSgz7ID/JxVfmqN/
 XtEHKcBGyDMQ+jQM+AsbbGCSOZkLZSk=
X-Proofpoint-GUID: id6Znxxj-XKVZWja3hngWmAUh4r2Ihpu
X-Authority-Analysis: v=2.4 cv=NddzRGD4 c=1 sm=1 tr=0 ts=6acca1c5 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=Qnx3dWhjQnPlBiBVVhkA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzNSBTYWx0ZWRfXx7HXd3Vs121B
 qVBhRs6cykJjZdXRAb0ETwekld8CXavh3+a4mGHC/Q3ie7+/m6CYuR4jVqkZzlhgFcYhH0QQ957
 yKF0VIK7JpPynM8UJucdHAUCR9vonofzbtvqocy82Y6NjXR3XpSPSduZ4owwlFycJfusCHf6AVT
 yYRKvaSG9v2JacKvMTcKo1OA9JBtKW0CIg2h2N599My1vUSZGXyfDeKy/AQl5sa3D3auEYXfSRX
 oaToE1rrJQpTrBAMBCSzoYKgqG3PudJ3WkVCH7XsdEAby+agjtMKU2EzOgWWyL6hFSRO/3ROEYN
 uE4LHMoiEh187UOdOyDf4so8uL4+CkvD69oWkKing0jpPrR2pztRhTHU3xR/3O7K72nuuxggEpF
 P5Ybj0DJQBHWXKS80H7akWiq0ea6Vzyh6GlnM8ii6+gHhyTMlONnzVXr9++JQGSy/NwJKoCxWAM
 ZbJTE3rwDmlm5EBYfNA==
X-Proofpoint-ORIG-GUID: id6Znxxj-XKVZWja3hngWmAUh4r2Ihpu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120035

On Mon, Oct 05, 2026 at 11:36:30AM +0530, Ajay Kumar Nandam wrote:
> Since this clock is registered with devm_clk_register_regmap(dev, ...)
> after devm_pm_runtime_enable(dev), the clock core should already mark the
> provider as runtime-PM managed and take a provider PM reference in
> clk_core_prepare() before calling the clock's .prepare callback. It also
> drops that reference after .unprepare.
>
> So this explicit pm_runtime_resume_and_get()/pm_runtime_put_sync() pair
> looks like it double-counts the same provider device rather than adding new
> protection for the regmap gate ops. Is the extra reference intentional here?
> If not, the custom prepare/unprepare callbacks could probably be dropped and
> the driver could rely on the clock core's provider runtime-PM handling.

Thanks, this extra reference was not intentional.

I will drop the custom prepare/unprepare callbacks in the next revision
and rely on the clock core provider runtime PM handling around the regmap
gate operations.

Thanks,
Sarath
