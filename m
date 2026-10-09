Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D7534F46F
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 08:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791534559; cv=none; b=fkxEZ/HfF3etWaZylTy473mnzPccBhdHz0JZQNsiCEb1Hg9FhKxyNlNRJ958XwVDzjpa694sm4/0E+/mFW0Q/6BiEkKnSHKZb1WdDkte/fdfz3d3LJaTdqmVfMIg+f5M2s6RzVyTSdGwG3XE6XeqpEoGKxcjw3PjgasURUU8Jks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791534559; c=relaxed/simple;
	bh=/SOBR0Ps2BnUTRiVud7w3FAIdcUaSqQ8Mu+izs62k5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hwggr4I/R3EFp5iZpy8IlupGp1jVbNsdL5Y/lD06uRe3GwZLqHVr62y1cUgMb4uIK4888a0X+N0Uym1nKs6RliVxVrXpbTS4KQub2U9bCo5lQNBXd8wlROEZvsaHCWz4B6dzXRon8/Ok52y/71KBXn5570ZhR/QNfyvaIuMmPnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZwbGWNR6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jIniirBy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZwbGWNR6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jIniirBy"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KIvG231144
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 08:29:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lXGhk/a8780ZR6oMz9Rsju0v
	1tiLizXrFKOLc8mUmHM=; b=ZwbGWNR6D867cmEY0fujoxLXXXMdO9GZAdrDv8/+
	e0SNERucHwLT383fDLSthPXNF1KAzFyvNhpQJhUBAHsaS1eGMckECBE7r894XQQk
	Hf8rFodpCNW3gHgJDjdoNX1LSzr3ij1M30w0HEd85UsXcuScuTVqri5o+TBEZumM
	9PtTghEn+2LgCbzKbix7XtgLs3CLFmBWNbsGZfOHxaRcTJghYulP70xg88KJRKQg
	riZl51lXyfJoHW12Jk9lZkgES4oFXNX2aq5hxnlCE/3hCvN7N15IEZlNVSAWJNH4
	Xci8lMxRItpQyQ+eog1RXbPullYLbdbfnT93pQ2GRngLww==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxu2ne9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 08:29:17 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91961d4b31bso123587486d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 01:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791534555; x=1792139355; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lXGhk/a8780ZR6oMz9Rsju0v1tiLizXrFKOLc8mUmHM=;
        b=jIniirBy6tVc1vv9YmtdQGbWSGHynC6rF8vEBTnzqdxvwVN/CnHHVP5QPgkI9ZlwQs
         jFqy8TSe28CcXYJv0jsKpNIcgP6tjbrzOOp2jdefoAE6BpDAbzg7Gtc+cjBmBkm58Vke
         91aLlq8hZDWuVsdhEEvbbKAmMlI+7DBkWwTCKzDmFbOuEi02EuKpRyARmTeSkKtndLaw
         mldlo9vhy2XxZ4AMZbBtBv8EFP9wdVyazdVc4C04YM1Yc92dySK26g57SAMjbZ+W3Hsn
         yLf5DWcnsy7YaMESp7mt6ztj8GQL1P+cD8lgkezVsU2jHNQL9vY2TYjl7+etzj1Xc8o7
         bQRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791534555; x=1792139355;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lXGhk/a8780ZR6oMz9Rsju0v1tiLizXrFKOLc8mUmHM=;
        b=Uiaof4HDky9SDebdLohvoJVZ29kTT5N7gk/tqvLhI+/EP2cscD72N2OfBOkglNGiqD
         rdB0Eg16Fh0z4iFWGI/O9RPFMwsnR86+dWs3YWAIfat5w/9gu50R2wcAuWE92AcH/k1I
         Or/K5gC4KEoLcLjmBcMC7wQnLpuU4Sw8j1qZ4C4ZsjmvB6jctdpp9oObzF0jHbMX0Mub
         TyyyyIB9MWdNelSnny28n9w4oib+EiJ/FaJ412VuNsLMmHdBRGKd6MDGJe6x+bu2zl18
         ttkBwst1+U4KCOsI6YnLfOsv3CZiv0MWWgCHe1/CrM7XeEEKYqDx5/sURlfV5h0zozjM
         Dgmg==
X-Forwarded-Encrypted: i=1; AKwUvBzgLk6to8qgFThKaKuoT/bQWPa2KL9rATkTKKFgqY0LBAbNaFoePjAY8nYmZBdmgI5FcFLBdz0Rxq2gWslY@vger.kernel.org
X-Gm-Message-State: AFuF++kmrOr887sazJbPxKGhGxsEfoNk2P08EFgIM0dfi82Ol5n924w/
	ZUU0i7ht78nS9Q8jrQ9ZlkPhb4AoXb1nR1kWUU0NBvHhLsViDKj7e2HlVoK0qVBpI55rvon5ojw
	bex2hPGPixQS9WTHw5iPwHD3UnWICqPQRo7zmjHFAdzcqPGxfhs6V6Tspsm+e1NgIzwVT
X-Gm-Gg: AYBFou12gyK/Z2uYfY6N9UDMpslWXCWtG98fxpBB7i9vsiF/N3ii7NU0T8OLfoZR833
	5LWWDlgKUd/+Ae3WvuH53Q9QeGlL8kYMfd6Tg/cQgyT+cu5Qo8++CyLOr9ZO9KEBK1/WbZW4bJv
	DI6Zf6T36uUlPpKHjynf5xdn1JIpM0YUK+Nbkne40HXu6Q++yf01+MaIV5Ll/cXljzJzCEAKzvK
	/lVw8efsBQ1ZueutxN10CRNkjVZoIOxfZrFP5lOUOJazTr6sUUFKrYhnAaqXoUMnbIEfYoGE+1z
	EVy8hJK06z3/d5MPn7/tfIDArdSSafPDyaYjbVNFzJ4SjSSj3N/r8tbHqR/zjJif5lVwN0pXNb1
	Orc/nDqO6mi7S2RMpla7pbaSENPW6CidOiNAEFUjWpCNOJokGqj7ipSjDL4bWfz5J1SzzCWChlk
	c8Lx7HHmFR5eeT
X-Received: by 2002:a05:620a:2985:b0:93c:9d56:a860 with SMTP id af79cd13be357-93ebd228f3dmr162550185a.19.1791534554717;
        Fri, 09 Oct 2026 01:29:14 -0700 (PDT)
X-Received: by 2002:a05:620a:2985:b0:93c:9d56:a860 with SMTP id af79cd13be357-93ebd228f3dmr162546085a.19.1791534554149;
        Fri, 09 Oct 2026 01:29:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcdde9bde3sm435232e87.42.2026.10.09.01.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 01:29:12 -0700 (PDT)
Date: Fri, 9 Oct 2026 11:29:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] drm/msm/dp: Add DisplayPort controller for Kaanapali
Message-ID: <ayqjh5syjbnayfu7wp647tclaer6vd3jbtfuoj32tlpqjyhfal@2uh543ydchm3>
References: <20261005-kaanapali_dp-v1-0-6faeac3a6d59@oss.qualcomm.com>
 <20261005-kaanapali_dp-v1-2-6faeac3a6d59@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005-kaanapali_dp-v1-2-6faeac3a6d59@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzMiBTYWx0ZWRfXwI4hl6PsvCQE
 xDPepX0b7SxguePN5yOV0XigNBmNj9/P8Ao7wA/f/boHfdgD0BIZMFVPbB1yZ7UJsB+Ek2tZrLt
 /fE8SJRkYQg4Jyhz6N4Wq2OO38QeSBOUY0bnF9ajjIOjWy6B342O+PleNffaiUIbBRGyI4gxUQH
 pQ0HtyJpEw0+BfKUeBvFZM4HUF0DqYuzNq4W/5UarhJE0xbhJKmPYvuIvLeYEVwP9VOVIhtxg0L
 dPwq/yDW5TdRO6PTfRYyPyekOSwkgMnNoT/OI+elme7Q/+vnlGxfUSEpi6PpSck+ov4XlcBIe8P
 5OVNpBrt93q00liYhNqqzoRS6bOsiMsGIefQwhG6LTXGZW+K0KZ9i5CliUD93F6e7QS81EOFtCB
 Ens5fQomOr+j5doimA4s2WlTP3x83px1ybFeExZWd5rkGrcgEOEBBzHbsUhhuPweDNoAW4U8Tel
 jFe09J1tPYArjlt1zrg==
X-Authority-Analysis: v=2.4 cv=QbjzLcbv c=1 sm=1 tr=0 ts=6ac8a5dd cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=OHVtJ8ySOF6wsxM0GN0A:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: iZyt0FbwRKIctkHx1BhDa6721hOKuXeT
X-Proofpoint-ORIG-GUID: iZyt0FbwRKIctkHx1BhDa6721hOKuXeT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzMiBTYWx0ZWRfX5mTBO5j0u9GY
 aspIvhvbGQ6BTmCnrr9dMj6hfFfW8IuyR6ViswEqwEkNEvR60HJXNDv/0p9ktxzd+De9TQw/JdG
 Vv1k0i8BZIiYS/PyE8dfTSxgwybFy3M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 bulkscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090032

On Mon, Oct 05, 2026 at 12:54:27PM +0530, Balaji Kalkonda wrote:
> The Qualcomm Kaanapali platform comes with a DisplayPort controller
> with a different base offset than the previous SM8650 SoC, add support
> for this in the DisplayPort driver.
> 
> Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
