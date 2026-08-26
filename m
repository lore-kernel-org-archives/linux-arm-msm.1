Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22AF3DA7C0
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 13:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787751081; cv=none; b=nueQwBKVD+7NTUt8cQLz2/tt1GOPNOKVXgyLhzP/TLkWid+pQGohC+b4MLULhno+7KrCreQeoS83/FuB6PnNc31Ek7ZwFAJT0JiXWdtTJ9928tiEldZzr4MI4xT3US68AsFkU/8cXKM5j+KKXKNSsVh7GpxyBZlozFVBlqBZLUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787751081; c=relaxed/simple;
	bh=fdaPCKAt3wQcUSqM0QgVlhzUnC27158ftVMq1DkSTBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FIjeUtsNM1MV64Jp64PavGEQXPAdkU6blYXc77/WESR/H3f3isnMaSNu5mfGYqx4WzrlHF0hojzggxgbIZqiHCliesu+9PibcZ2shGwwr/uRzyqRdgwvurCoXvqgS0kMCk/jNlxqVaLbHdRWlnCj20j4dtkdQnjkzKIv9umJTrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M7o5vFKK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DCitXS9d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M7o5vFKK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DCitXS9d"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QDHbU71617696
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 13:31:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9eTNwTlaNSB9i/d76Sx2Ndi9
	H4zgRZykgqMeSejjZHA=; b=M7o5vFKKjAxGQ9K0jJbauY5hrNX07jlEWQ84WMRl
	umbHE1yIVt+FY6YYs3O9KPx/+pLHRQ5Jx1sPc5ZR98cQjPEMIwjy0mvuh6pcMpd7
	r2ALhEmuNUbbV8ymgPKX7PlIC7SONI9Ucc42lmhAiIbe2CLwBnTJ+ctk392rI9Ne
	Hrs3SAtKkLWq6jVwR63nzdE0yXXCR+HbvsWEs1gbPqQ7Lq1QWP9Amk1OFxG+FNzq
	73xnGOXZp7Av/YwX1sgM9vUHcXNbEiCZVhpItxHcinAv1Saklq0Wo9qF7yxNwqGK
	KI+aHNzPir35XDF2IQn4zIH60ARyVfx1DTORjybO15pWkA==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga0wbr1mv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 13:31:20 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7ebfcb4c999so1853954a34.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 06:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787751079; x=1788355879; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9eTNwTlaNSB9i/d76Sx2Ndi9H4zgRZykgqMeSejjZHA=;
        b=DCitXS9dbekcrayrriX1eWNBdc/U+cOkyH6/mE74Qwsdj/ktJ3JJ5x88NWxhNgP6HB
         b3KpPbQq8yhB2/HmtKrGXxckhQUarrT0JhJt+Hu7irUZhvdCH3Tk5YAvz2cvy3aAiQmC
         bCZEW7UWF18XnI47ofvdNA+esjhbIVGVxjMneckzWssyFNUa4DhCjfr1fb6bK3Y+Zlc+
         SKxFU3eFq5r8lt7wcBYs+ts3rDo2uhzGdO+EKlNs6LfFVRxRcD0AJBb41qTmLM3lNqxo
         MgXi2fENmIW4J7hsCL5huUrZS3HkECzuaejyGyhai3zEAz5D6mqojKSIhM35ic1mGmwj
         UGiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787751079; x=1788355879;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9eTNwTlaNSB9i/d76Sx2Ndi9H4zgRZykgqMeSejjZHA=;
        b=eB7N1LATGu6bma9beDlF6tjBZgxhFLc4Pmj/W6DDFLGFbNFuqkrnYifOh4exFktRqf
         4TpaGsHENqpbSysYFtib4OyPRagGqtwlDv/afqELXPj5cJ7Pug0cP92MgDR8AWZbf+2d
         8xkEHkF+27i4C3eQPrMsnXFK8BfRkz6odOYQE9ujbV9RKxdtM9NRvgJk6lgnLOhXY8Ju
         TqTg6deqLIIFpoeMole8Rnj/7CZ24hv7lkbjeLh69MXorh3+w+pmOBJMizij2TL2MYNV
         Xws8IyXb3IBlxYUyvPXB5lkVnnEmcaQI/1ZJvKw2Y/yzcP5MEn5CR8Q22Ab0O1AHc6aC
         6YhQ==
X-Forwarded-Encrypted: i=1; AHgh+RoXs3Z7fQh88WzAYgOEb+8p0xkOoYBgQzBrY/AOu0fEQoiisaWk333ji5Bhob+5F7o4QaUAcAG+5jD8MMSh@vger.kernel.org
X-Gm-Message-State: AFuF++kN7DNakZkY1tZEnNBwe3dvHf4AIvqWi8ZBHZc7KFAi+Ms1TbED
	bsPyNXoaRN82PrZXGiFE8k44dJ0QJgHvSm0p/dvKfjA1wMlPRTJy5U7i0UGCA6XP0H4MU24TSJT
	zUMhr1KxWA7R5muTgXdcXDbotHeJRqjtjq76lizM4TrVnCqJnFTM+7t4NuOXSnsAWCwia
X-Gm-Gg: AR+sD126ehLI/l1VsbKz6LCSGbYoOVlWCVZbhVbiZouAL9ohJVCUh5dyUUH0ABRxTzy
	KuVyPyXrlNIoVfMj63ZAiqYwbxEjvT9qsPrNrGKBWH9t3TyNQ1djUHLtKxrTRoULYZI7fZevgKl
	/VXUI6kWtiYRq4GnFfKCzSugbAXmXR0xHXK6POS+3uul8BA6RksOLaanP3kopSBxSMYFhwkT2pR
	CouZTm38pSpAfZGahOhCvtTTQk+lTPZBVGgZHyAvDO5lnGhQitmoN/6YjpR6Hrcbt69R+Pmm5VC
	Ue3+AKdPdgineWo4V5JMlYLlcRF5Z8Dp/WRt3vORA37cyko8DFRDOe4UB1MfRusZiCczp4vucp9
	pgPTnnYEPTtKuXhRl20xlD0Ia1/N2fmeG8LtoT3n7F5w=
X-Received: by 2002:a05:6820:c8d:b0:6b1:5637:e10b with SMTP id 006d021491bc7-6b1a035e489mr7181726eaf.7.1787751079272;
        Wed, 26 Aug 2026 06:31:19 -0700 (PDT)
X-Received: by 2002:a05:6820:c8d:b0:6b1:5637:e10b with SMTP id 006d021491bc7-6b1a035e489mr7181616eaf.7.1787751078689;
        Wed, 26 Aug 2026 06:31:18 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b1a2501bc1sm1722462eaf.4.2026.08.26.06.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:31:18 -0700 (PDT)
Date: Wed, 26 Aug 2026 21:31:10 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: remoteproc: qcom,nord-pas: Switch CDSPs
 to NMXC rail
Message-ID: <ao7qnvBaHEGNz0Hs@QCOM-aGQu4IUr3Y>
References: <20260826102746.633076-1-shengchao.guo@oss.qualcomm.com>
 <20260826102746.633076-4-shengchao.guo@oss.qualcomm.com>
 <a986fdf1-4acf-44e9-8abd-46dc6928eb34@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a986fdf1-4acf-44e9-8abd-46dc6928eb34@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: pxzG-gWtafVBA5wuwh9ofZL8sQO3Yd1R
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDExMSBTYWx0ZWRfXy8frkg1KS0uG
 JclaU7llWgGY8fyJgpEoB2hqXZtbJGMLLK10RHHu7HDQ7dglPI44SMauh566MjDHFXE0mq4jPAx
 QbKDDrBSsHHpDKSBuy9zihqzssp03TQ=
X-Proofpoint-GUID: pxzG-gWtafVBA5wuwh9ofZL8sQO3Yd1R
X-Authority-Analysis: v=2.4 cv=SoCgLvO0 c=1 sm=1 tr=0 ts=6a8eeaa8 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=PG6VhwoxSfHQhqF9RBgA:9 a=CjuIK1q_8ugA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDExMSBTYWx0ZWRfXzRgia3xUsNzU
 k6U0C61tP4/KIl7lvXx1xcKYg6Rn4uELzKYLo9fwNgYfuX9mMXilqDYw8Z5B45/WxHyAn2Dj31t
 m4pYlKGpX6jXz2kG+fs0588/9OW6FjP5l9q+gvhjPjEvKsulonwQJoWlsEAgm/bSR7qLOCbG1zq
 IhsLcveKgnZMjAUd7EGzhg4r7/BUYNfs8wH/7q8ruHFf/pnJGWXOgOfY8+jmcttszSk+wrntsy8
 90Q5nj7apEQJYC6NjgJHMJGrikU4nd9hEa7D7HT1p8Uf82iRdqXgF8ECanIZa15j+iB8xet0JC0
 K8Wf14t6kLBRcZBolYAaX+wfsWZg0OdmxYh9AJCtW0QnQNI2LaG9rwgpjCebYoGDVhnTJ5IQwVr
 qZgSmuuMJ9yN1eLnoemPf790jSQlM4Qv3q+Lrkhw209gP8Xs+Wd3HTQOjnx3Yg8MKelkzV2aX+m
 4TL4dDog4U7CXMs4Y0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260111

On Wed, Aug 26, 2026 at 02:52:55PM +0200, Konrad Dybcio wrote:
> On 8/26/26 12:27 PM, Shawn Guo wrote:
> > Nord supplies the CDSP memory rail from a dedicated NMXC RPMh resource
> > instead of the shared MX rail, so the CDSPs have to reference "nmxc"
> > rather than "mx" as their second proxy power domain.
> > 
> > That makes the ADSP and CDSP name lists diverge at the second entry, so a
> > single top-level 'items' list can no longer describe both. Keep only the
> > item count at the top level and move the per-domain descriptions into the
> > respective branches of the existing conditional.
> > 
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> 
> Is the name of the input not "mx" at the rproc anyway?

Ah, good point! We only need to wire RPMHPD_NMXC up to "mx" in DT.
Thank you for the comment, Konrad!

Shawn
