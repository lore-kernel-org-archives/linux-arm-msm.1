Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC243382EC
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 11:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787742313; cv=none; b=JbwuyZSe45JDuUuzgaz7KKu3qSoW86576QxFvtLgXYc5bdV7DWFEV3Lp4P76NS4PsiuIeFNKciKu0/HJkx5rRKVna6qw2WUKFoytp+xDTRUEl0B4J7sZ3SClfw1w36I+uv0BBACxiIjJoaItOKNPzFeqoEZ+doVMRlksG08Hqds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787742313; c=relaxed/simple;
	bh=YyYUUVqBJGI286K5cUmRrDnI792ynvOKG4YEV7L1rJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j5giBaB87A+UbRPLZcy1vebX1vBLw9sKhUNCyde6YwpUSvlSkXWiUYLDkjfZkqQi9hsgSDsV3N1YKkxImsYkWsJs2kUltRodcg4w97vpYo/AtCFfurTwWkDr/ymWkkGLb8TUFM2b6jR1amJiLAUaGXYKjYWrQRE0US000XQpZpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oRINjrDx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JsVheKM/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oRINjrDx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JsVheKM/"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAH4UO3648234
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 11:05:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EnUK4lzSsA+4H8FJzIU3OLV4
	bLy+1PASPEgPsSBWvBs=; b=oRINjrDxgmZqQjIfpGtUwo0eDBbgp1Y8D7vzVdek
	LLP0kpFXcUyoAf44yoD3tsow7sa/jKRgoZ5onKcGz6gTcRQ3tk7HzUulXmX1UlkS
	HXSTm18zJT3h6jsPxajQ7XuAijAO4nNMSYWaZpj0Yd6ipmsj58deSmBmKnuzsrmc
	F3iZI0wwKUx8UUgtICHJO47G70yfaWl65qbBxVy02x7/JQbyyBKW/lnF7vsb558B
	WceseKuuIGRLKzJ4jQLVY2e7spvVlrGdWuV8qzmSJpRsbzyi9AdOEiuJsnuTW5yx
	u7Tjy4xw+v69OV4J2gyhr/D4WFHnLyjGNjeHOuTxvsoB8Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9uthrtcc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 11:05:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52ce3c7cb2eso16045891cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 04:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787742304; x=1788347104; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EnUK4lzSsA+4H8FJzIU3OLV4bLy+1PASPEgPsSBWvBs=;
        b=JsVheKM/rHLITwg1/j261Lis6usL3OvBgP2rSinXrZPB4La9FwZUAuZf0Gr3Byzs66
         hQPh92ykkHw/Z2O+VOVtKfNtMH4KTqgvKE3Dwn17iMeZpx1M3ZQS5zuP+RbZ4ibWlGsI
         TQ5epCHmeQq60UfQDlCwtjn0BnHd9JliwIndQL4GA2xLIzq36KqzQh+PhQuvkawzns3Z
         +JPp6Bgh/WCh7QCEyEWp8xpxdFYWWmWXAkxO7fnZ9zLzMLxohO4fvFwJYm4pp1ZEobJB
         9WVtIZ4ZgYNA8JqgEOngPe4feyAF2SXGS3juB0rM3kZFNUEcOAXXR08mF/w4q42gJyTF
         2tSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787742304; x=1788347104;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EnUK4lzSsA+4H8FJzIU3OLV4bLy+1PASPEgPsSBWvBs=;
        b=gG2uu+weSYOZwKfME+nXzOoE+Cf64tbrNSR9EX7sJaC2wgBOZXex9TZ+650DcfMoWq
         uNAvEqNcfSRCmmdvwbN15FHAAH8bfs+Go2CyNaS7ZklVljETzeLFsHTVp6/x+/8Bq6eK
         VJfTFI0fjWEdvnY58bVXY3HM9q+l8WlgKcO8SXxgOiPuhSpe9mE2IQeFwMiuhHy3Rc/a
         HiAES//wr0Q7HSpX+5vehGNYcVf+SxcwlQWi8uAOEq5uyvq+xS3rDSumatfWe6eA1tZW
         HrlWbqFElNEGn6V5kXpqGQ4S5XpeQ87/HGlVucCbAvr0oJN5ph5rPEpX14WgD9JzDkL/
         gqWQ==
X-Forwarded-Encrypted: i=1; AHgh+RpYK3nSgiSvBPzOOxW/Qa0qT+Aq59oHJoKp33l8X2nAadf9Kel1hHY7RKj1JbkkzfzPbKP4SVVNBjVp6HPh@vger.kernel.org
X-Gm-Message-State: AFuF++k0u6PX1eaOCXken13FN3tOR+lm2CFNCwrlyCzmuR/S3Mg4kWN2
	SWtdGGw2VZwVvd6xONt2Y0MRbyRe0QNde6ixLPRpW9hOtw2Isqg7/8MyodXvmu0hkTnJDpl2R6t
	LVc8CqPvTBZHnKsolDCI5c0OcwkEsfAKHq53tCathPYrY4XUpFGapMrMvjUPoe1bQ5LoZ
X-Gm-Gg: AR+sD11j+NKByw4E4J0ynZY2A2reniuYrVj1hJxU4gML6ieYGyFh++0ePxm2wU5uczD
	zms61liDkB2Oqu7eZRD1oBdawm0/pMDhdaKaz2bJNCSAfPYV2PqAv7cm8rc1ebE6IRIz6UjHjmw
	bY7mZm7bHNROe86j3zfvZfSBLXMDHoRhix0H+MXzHrVRXJnmqDFeZaCP/dO/8ZAQJGphNlFY2JB
	1e9ipY5GrTiNHhviOqUudpsoKpurniSlqgYUTeTRLCj1UYLp8tc4bX6ayNwZDb3qxz7RgY4q0GP
	QC5cuQ/VpvcRqJKdE+wVhsaXjoquxKFr4dsLsbUPAWoX3pQmQkyHsse2vtqsPJRX64mmKyf7Q7e
	1Tcc7o+pz5fbt
X-Received: by 2002:a05:622a:1b25:b0:52d:f376:c254 with SMTP id d75a77b69052e-52e422cbe1fmr59964511cf.10.1787742304411;
        Wed, 26 Aug 2026 04:05:04 -0700 (PDT)
X-Received: by 2002:a05:622a:1b25:b0:52d:f376:c254 with SMTP id d75a77b69052e-52e422cbe1fmr59963661cf.10.1787742303900;
        Wed, 26 Aug 2026 04:05:03 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a6fda4fsm496909466b.16.2026.08.26.04.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 04:05:02 -0700 (PDT)
Date: Wed, 26 Aug 2026 14:05:00 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] pmdomain: qcom: rpmhpd: Add NMXC power domain for
 Nord
Message-ID: <24kdkayk7odpbojcvbhzwupzvhqgtlei7d2bvbrjpi372z7hnh@7fte77gqooaa>
References: <20260826102746.633076-1-shengchao.guo@oss.qualcomm.com>
 <20260826102746.633076-3-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826102746.633076-3-shengchao.guo@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=EMA2FVZC c=1 sm=1 tr=0 ts=6a8ec861 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=WUwTdx2_Dbflg4nuc2oA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 0MgRoT3QqukVWnkoNbA_ooOPcr8LgpmX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA5MiBTYWx0ZWRfXxry/Tp/Qje9C
 wm6Lr/nGwNy25Hse1/17ln2TLagE2YcfLlsS4uZ9N65hpgeHEkyMk4z+hdpCJLRFLkrh+eVe5Bn
 LbDbvPwpWM2/7TB2EApgdQR1z/fQBsps6FKDsMsdUzffnQPl2RE8VVdetC2DS+f64epQ9pISkQZ
 K2cabflBri3CGMMOWKcciacxYFeAcjqF0sk8ExFFeOBhpAIO9zP9YW8FC4wE5lZWMs8VXR/XfWq
 8EabTSp9qP1I+vHyvZ5HOjJVWluCHpDmYngLsAOXqWEEof1ne08sIGFSAYwaQ9bb1+W/9jhWZ7v
 9pXXon478hatKoYx77LzFgwZy0mS8bn01Fy3PVm4VnFgO0yABlPpepBtY6SYLE7e15W8xObyH5D
 iqqqSlHEcfCX4TRlXSQbyvbsmZ8lAat1lYmM+2ku34bBOZLrqzFVxMRLCdq9Ll5nXbaoeYBe+1i
 v9J/8OqQ/LbTXy/+ysg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA5MiBTYWx0ZWRfXynvgbAGz9RHn
 /o0woAnT4O2VePGG5dxZqiYFdwtEaxuuErP5qpTkKjgZxjbHiOQXJGeXFWDPuAPB7HCn8MJyjKD
 siV22UPtEmEJdM2qrW6dIm09jNTKswE=
X-Proofpoint-GUID: 0MgRoT3QqukVWnkoNbA_ooOPcr8LgpmX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260092

On 26-08-26 18:27:44, Shawn Guo wrote:
> From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> 
> Add the nmxc.lvl RPMh resource and register it in the Nord power domain
> table. Nord supplies the NSP memory rail from this dedicated resource
> rather than from the shared MX rail, so consumers need it exposed as its
> own power domain.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
