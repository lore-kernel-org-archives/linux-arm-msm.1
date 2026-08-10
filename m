Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC123CC33F
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 12:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786363624; cv=none; b=etVYwug2ABJSlzLAD2NwCvfV0BUDG9K0M1k9udDXYmc28e60MqUzencI9eQiWmp+ABdwvwx1Im7eFTPozHlbMOllGw5k1JumZn4J5BCAJsrk9V5q9Ygy6Ob9gCSTVnZPqJLCYGnk4LJIq7k2jCEJAa0ZlHPEgKIRpB3WUeLM+CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786363624; c=relaxed/simple;
	bh=n7lVczSlRIV18NCj9fuCw396ECEW1bxqAhAAaOQvHPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=asr7+tKmJYY25rxCH1fMfQIXczkm6+pf328TfwpP3cRM179zp3Gn3jJ79Tvw+wz1uXUPx3iyZqI/f1ClPbrYIMeu2eBCoK+W4JTyB5xbYuokgc9uOptD7qXxkXDm0Eklh5AVDNty/mejx+3sRLqtUu3C8sudPZd94vWwoSlqucs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VJRyEDSj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bCkiBtoL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VJRyEDSj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bCkiBtoL"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A9S6XH872709
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 12:07:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=N0HEi9O2CzXx1Ui/rB9m47R5
	NYtN6l0Z2f//VUkgfGg=; b=VJRyEDSjUifcoWW5Kjw/0f3gcXjA26K9egL1Wo8u
	qnsKzXbi9SzEJ2TBUlYKmcwPEhICTGNdexNekSJpMzOaTiPG1RyjOndNmEVk9JkH
	Ap/K4othTW4jmYCpX4kg0xaQz0x44wawGqaYhW01boigrfEZ7hbeyrpkRq9xAZbC
	cIvA8I9c3LYTU2Eio0oySYrX0SCzc+IcUZStjbqKoUnoUAk8S5z7i/OieDk3sEE0
	fJiC3c9/29+25oLfgsJUNvSX+1yt3sO9D2xYYfTGmMyvrrUcgvV8F4pBnOJc2cnc
	8jHU0D+TKwnGX54pGLrnUKQz646EkP7iDkp+roVq6Xc0lQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v59c98-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 12:07:01 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51ebdfceddcso22731411cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 05:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786363621; x=1786968421; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N0HEi9O2CzXx1Ui/rB9m47R5NYtN6l0Z2f//VUkgfGg=;
        b=bCkiBtoLahYT/CL9/u4t4Bj9ODUig5IFOLjWGMEBluAqGEoyvnjm2RAWrpcvpYo6FG
         tVYdR9JdTPpI75v6Q524CfmGydJIOSnIyKX0CcJXQcZ7i3Llq1eV96yI66inLLIsxn/Z
         pXtQhkAMP5yGEykVrp77xw5wq3w821u89iZ+UDmIuAFyzJ78wqB+Z8FeYOEE2+owQZwd
         WJv2pe605anCp5j8wd1RW6RhKCEyuOggJIYcJy/qHESogsbtghGi9AiUDxglkvCVbN3S
         OaAHYN5VL44sj3QwWhRQmTzgWzJnmRzZjDEQOt1/tmYcMjNzHCyoBi7DJQmd/PbYab6k
         tqYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786363621; x=1786968421;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N0HEi9O2CzXx1Ui/rB9m47R5NYtN6l0Z2f//VUkgfGg=;
        b=UuSZAMAmG1p0QttZ9/LGnMSZcoD4RlMeAFtx0zTtkFcDFwO4ffdJIpoqC9CTmetEIn
         4O0U1lKxgRqu8jiL/Uh4C0AcZtj99MQKxh0dsNLl+wvM3zBaiUnqnM3sanwceqEyM1Mk
         SELtvnsXmcOrA7+ScbaCVk/00thVob/m3gmv7mRf4gOaLOJofRKW3IT0uIp9zmOnPaGg
         bGmmAt0VZfbndV1tPoALb8IuWnKxg2cgmwJftG2+HYugQRpP2pCgi7W9INbQwg5zGCtq
         eZJyAXTuL4/W/gQuJq0nlnz9QKyta9S7slkItN3XBeGhQMVGlkZArfA/AhQWq291Hr6U
         wz8A==
X-Forwarded-Encrypted: i=1; AHgh+RpfMkJa3TsNiFNlhU2HN/Ho1BlvdymKFuV/NuttKu3eJmTl6wjTdgFMvXIeFNhedBdgvU837pdK9cLDyTN6@vger.kernel.org
X-Gm-Message-State: AOJu0YyyXGafoSgj1k1tl9gEf7N5J19XFMsjgSlHvowL4ZT6qz6OFdNx
	wh1QVi/5RuapCrO1FGERhZEcbdGiHV/rzBKKemWVdT56som6Sox5+9SbUZMRstdHmqzXizkS/LM
	RopgmelHVoE2qUkKbt9WL5mgcYs6mg9uRvrKM7jYnwUhiCQDcgCh2iTF4/dww0A63dC0W
X-Gm-Gg: AR+sD119r+cHlo067EJSrxQ6Z50vpN2IDjrp31+AK0g+zhBobzRwrsr5F62tYyIFRZE
	+tLdRSlLmzgNmEIoE3vDA8rRbHrfjrZqzL9QpJUPe+E5/MrFtzHzG6Wf6yJhJnyP7mhrlbyLXzd
	7bdaA0UlOlPrS3izwNBRepllGm2cjhg/MYR0VMpbetJHn5CBCHtxilMbUzDDJlE4ovKbXYdiDeC
	DQ2E7gaLJCRxZa367t+jB4TIg3irGdeyVf1+XKCwOblZ5z4utVo2IuuBQfVxrgAuB7lXOkkZ6S0
	159a0zBKwlFC8gC1geHJtJzzbQF+w3wT2AGR3BnQV/iB4rqryMBO0pzKVrrsAsjwAG0Wrjgq6d1
	fnpbKqxgxhdA=
X-Received: by 2002:a05:622a:14d4:b0:51c:94f:8ce with SMTP id d75a77b69052e-52d4c11c3b1mr9645811cf.34.1786363620356;
        Mon, 10 Aug 2026 05:07:00 -0700 (PDT)
X-Received: by 2002:a05:622a:14d4:b0:51c:94f:8ce with SMTP id d75a77b69052e-52d4c11c3b1mr9644721cf.34.1786363619693;
        Mon, 10 Aug 2026 05:06:59 -0700 (PDT)
Received: from oss.qualcomm.com ([82.77.85.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021f8f33sm39949757f8f.27.2026.08.10.05.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 05:06:58 -0700 (PDT)
Date: Mon, 10 Aug 2026 15:06:56 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT 1/3] clk: qcom: gcc-eliza: Fix always-enabling
 PCIE_RSCC clocks
Message-ID: <o7dyjhfig543yd7aoxjvcznzfbtvkjnxbta2lemez3hefbhuhe@cmuw7g4bse2w>
References: <20260807-various-pcie-clk-fix-v1-0-5caf78a599d7@fairphone.com>
 <20260807-various-pcie-clk-fix-v1-1-5caf78a599d7@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807-various-pcie-clk-fix-v1-1-5caf78a599d7@fairphone.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEwNCBTYWx0ZWRfX+ZSDsqsRgQJ5
 8VN1CLep3UOkMS3alZPX+Ga8bnndRVwl1VloRr2g8ELHgm4L5sVRPXZDKzgtHEHnXsJ9ZMpHNUi
 c6JGS3B6ItRflddm5EbPlzpVj/AfG/Y=
X-Authority-Analysis: v=2.4 cv=J6qaKgnS c=1 sm=1 tr=0 ts=6a79bee5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=GMu+mMXmPKlJm/I3Pt7gOg==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=wwqkVmZ0C2PESZoyeMoA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: IjhdhSdiBYo4eCZNMtMjJnNqxkoY0gLk
X-Proofpoint-ORIG-GUID: IjhdhSdiBYo4eCZNMtMjJnNqxkoY0gLk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEwNCBTYWx0ZWRfXzSR4mwmwQ5Xs
 D/2QdLPMhgHnAD/jQyPPne1nbquzh8FjHuTWVuvXozgNZP45fwUGZaR5ngvddLwRsyT+meLahPE
 HTUzGWY/GRrGf83+iHU0W0/l8C3h/2JPoen2uYfkQ4dEc+qjzLKYsULY851a2T/d1CoNSl6Nrei
 zIk1f+OOvAFhFym7kW/nU6YFlFo17345sp4zrtUzc8CRjZfLEL8OfHz7th1aSr24MZJqU2Ug7Up
 HsHZNlpV+IrpMuQWbK8EsCh0MmoWXUVPfYDV7OJ3+32wmQL3KigoX/5GAUJnPNsQhK0fwAcTvGf
 kjMNSlCyvS3MVZV6zzAYbMBKOx9Frr9A+3wYBPIq6TJGCegFSWhi484VQZaJm0N3t+1WNmL486Q
 gwxG1JOiKfHczu5xDNx6WpVdiUWw7oTGl5CDfNKhIjt1WeqzfFbGnti7SXhZ60Syw5uCU1jyPZA
 Jw5UJscYdEqBhDKzp5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100104

On 26-08-07 09:46:04, Luca Weiss wrote:
> The critical_cbrcrs array will get qcom_branch_set_clk_en() called on
> each entry which will set BIT(0) to enable the clock. This is however
> wrong for these two PCIE_RSCC clocks which need BIT(20) and BIT(21) set
> respectively to enable them.
> 
> Fixes: 3d356ab4a1ec ("clk: qcom: Add support for Global clock controller on Eliza")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Tested on CQS EVK, which does have PCIe endpoints.

Tested-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
