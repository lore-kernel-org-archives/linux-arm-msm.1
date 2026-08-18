Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C6C449B12
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 09:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787046857; cv=none; b=OFNEYgE2p1jm5n8NaCSHnEov6ZRf0WwuJiCX26171e4jTs8Vvywkbo/91wc5q5uS7dOJ5YgYYWhp7vrKZBMvryY+WUZBr/2oNei0UyBljLvizPAw88Z3AyhEk2B13Ghh0DdHUUp1CFIj0A8449+H6rl7Ue4XiI3hHrvCZLh/Gy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787046857; c=relaxed/simple;
	bh=zy2JFeTgpyJs32UM9HTCRmf/W1CVw+Z3BoFu0sXvHyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ESDzO6fAAWJ71BlsdR/yU/xuB5dLiq3j4Rz8aDyMrs870LpKgGAEUy6+/JxdKKgceXThd4hrzht9plVM61lEgWdVSpXHNZZN7yzJKZyAieH6ttBleW02a+4ZlNZsq8+W8HrHL/jR0ZymjOFlnaaFTcwO/c2xD7O6kY77dXEDhWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A0o/HeB1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jn6C+bIJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A0o/HeB1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jn6C+bIJ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I8BI381270737
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 09:54:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=r3Mm+8oCJJc/ap6W3LUSX/4Y
	m6UjXCdaaNW3eV8U8VQ=; b=A0o/HeB1yychTlA9jQWEZWE3C57LT9ihqc7C7RkA
	YXuevxtWWBusfs7HynoY1y70sDWPvlOaDVo4+l90mRFR1LkMVsJrfXuBP+0G3H3J
	nOqDGZ/nXRfVaCIncsK3Z7cl9VQ1YgWbdNZg4KTLJFfYXJITGa5r6U65sWoRnlr8
	uR2mRg8gEEXoTgc1KLENjGYx7YWP6nH7AkMDGAPwbB45qZmpImUssdIW97rbvtdJ
	Ueq48qri68SwPgb/Xcc9SbDFyl4EzqTVSoPOpfdlHUHshD+q+FwSYViRUKXQ1/tB
	p4jqsflIdboUVEys0R7UTUk3fiL9jfI5X0f9ruHRmijN3Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4dcn21je-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 09:54:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93494527488so736852985a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 02:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787046854; x=1787651654; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r3Mm+8oCJJc/ap6W3LUSX/4Ym6UjXCdaaNW3eV8U8VQ=;
        b=Jn6C+bIJ/MADS92ipSF6rTAZ1okyFo7wxZ+og7NugyKZPACG7gGi+56GjjxdIEnymC
         m2XU/TYDEPYkA4XXypOkl/ZP7FgqahstsGXzMTS5IgfY5oUqdAbF0MNOVEmcW0UsldLU
         nxxpzAzZ0ALpHJXd410nqqHRRyeV8u0YoOjtpkP4du1uZcW36ag/0g/VybYcayNh8RUS
         V1Ivf9J9zuWS1OHhwOT4XjIsVJ6eeI0sHlxRpOiibhUiEA47NKreyHZZaXJikgz7PPly
         GkfKKSO8Xt+PyFXwWr6Aq50BY5au/aiula2vTsFq1KK26N32lPmkYJ5QeUY8aU0h3bfx
         e3Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787046854; x=1787651654;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r3Mm+8oCJJc/ap6W3LUSX/4Ym6UjXCdaaNW3eV8U8VQ=;
        b=LEWPMI62W1bf1BQ9T5IicDTpYBfSjbk141uxyBKQeO5+wxNBrE5KUoufPuZnN9JDta
         7L3idaoZFtJMrd212DyCeTvrKltImv7Y+rvPSl+VvSgBKNVzHel5qOWC9sekaZpVThyC
         bPq8WDObxt27oemCTOnfm6F84WDWr8PxU5lXckPSQ5Pgf2OEBS40DN/3VCkgEJK6D/m8
         UsSZCfw3R9YnfEytpLVbCZnYXXnB7vs8BzXIw+K5Y25a1Nr8aq9EOdzVh0xdZIVetjrH
         1eN0z9yEjhhr9IL88CMQmWXQSTr6sdRcRmxOymiDu0Fo7EGFrWDn2iO7ypeNLdii0UGS
         1rYQ==
X-Forwarded-Encrypted: i=1; AHgh+RohUVOEEWtLjxonpqt/tGjI1EE+T9Cpr145FVl1tpToHLA4DwKJm5m8di1M8khgEz3RoS2bx5wrpXJqv1A2@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/uI3BQs4ksqXJJi2s3l098NYQRwE4AuZmTooJDw0bXpJo/DCp
	6MZjzeZj284gzNT51kqPZ1zNicL6D1X/3tDAmkIbDUVwzXAdnusa3uzXF3d7yxHoqu+Z0K76s98
	wqgilH0dYGm4JWK4ky/HbYg3SOrq+OhcjcPQ8vOk+vhgKPNAgC6O2XB4M0AY6KaulmwTV
X-Gm-Gg: AR+sD11EleZH51E9cN0BViRDT7j49/fwJdcsKxkR8sNOx+h8h8GnaIM8zd3VHQxiPvv
	4yVvMRm8ZA+SEd9PEnmEyzOlw0QGQdAUfBevHO8yxFUT0i+NyyxYUpC+cHbi5HEDNgYiDPbWwBn
	VIzJhmMb5wJVKKrdIwn135iZNkIayot8kdWTg8Ew7/wh0pRNbcYTQ+vF/ilScJlWjpAVjoiCpSF
	d2xRAoOjDCK828Ihzqztga/5RogqiGhm9CckWnwbaaiHVoq0ChzdHt+Beav+06vGq+Ttd8XFIZA
	4TqkLIgEgRWNhM6Fifv4GiCxxbMfGWBSPCmmR0fHOvb5izVikej/mo/9wkuOYh24E3x5gZeQVfL
	6OEIMzlQe3z+2NaA=
X-Received: by 2002:a05:620a:5cc1:b0:914:afc1:c66d with SMTP id af79cd13be357-936d201c77cmr2685404285a.11.1787046854079;
        Tue, 18 Aug 2026 02:54:14 -0700 (PDT)
X-Received: by 2002:a05:620a:5cc1:b0:914:afc1:c66d with SMTP id af79cd13be357-936d201c77cmr2685401785a.11.1787046853563;
        Tue, 18 Aug 2026 02:54:13 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4999619a7c3sm208222495e9.15.2026.08.18.02.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 02:54:12 -0700 (PDT)
Date: Tue, 18 Aug 2026 12:54:10 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pmdomain: qcom: rpmhpd: Add missing MXC and MMCX power
 domains for Eliza
Message-ID: <jcbosjb5hg45lklhou6d75vbvqqjgno5vsrrvhlbzx3hukqjtn@5nowx7zdjxxp>
References: <20260810-pmdomain-add-missing-mxc-mmcx-on-eliza-v1-1-5e10fad1e456@oss.qualcomm.com>
 <wcmnmidvbgfr2zmkb7vs7rhrwrxutca3lbfd2xb4llzfqqv7w6@bzddrstbb2xd>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wcmnmidvbgfr2zmkb7vs7rhrwrxutca3lbfd2xb4llzfqqv7w6@bzddrstbb2xd>
X-Proofpoint-ORIG-GUID: -CcKGct3OXcjCv-0FFtMmTa01Vev0fOM
X-Authority-Analysis: v=2.4 cv=Gs5yPE1C c=1 sm=1 tr=0 ts=6a842bc7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=1so8R-_4SYReG1rYBfYA:9 a=CjuIK1q_8ugA:10 a=QYH75iMubAgA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: -CcKGct3OXcjCv-0FFtMmTa01Vev0fOM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA3MiBTYWx0ZWRfXydP2kB3vAKWW
 sBe77mtl6aXTbzAcTHQqkRrIT7eRaFU18dlrCg2nk31cB4RPL7aYz7AuVS+5Iz1GyU8/s8jXzng
 huyu6pyYW65+0i4SRZeR3y/aoFb98AnD+fQTU8IFxwa5NqbYRj/5fXcNeewyX8o1eVx4mOJJ5Lc
 sz3z66usWl0yMeGqzISCIJXaBJf88Q+BvONvK6kmPR3ZAa9nfgtZ/ou132NA88o7xhlA4owU5Tp
 VRjfmZMl7gcq0suIuwZE6avb5YLu2SWoVl+2Sdi2s0Kjsg3Dop+SUkRmZ3VxfjApKZmKmApYgLF
 JmrlHyDDxrvkYTKKNOVgAbLKhIfZ2OM+aTrymRVxjPlpQFtISWGz1D5cVB79aR2miui+wZOwKGG
 /Atg0U3HRo+uDpLyErrdwsxaDNaXfXfeRyY+HURHutfmZ91EBWJAgGnNKtsQz6PBYsd0yLs+yVf
 BzFeblXGJxXuDBHiIgA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA3MiBTYWx0ZWRfXy7f6Cj+TnH3R
 CloBYLPbRgHq0VbGxCSus47E6vhgzw04lTfVXylp3W3BeuGJMmq9Hub+khaM74qGdLwOgZDEXT8
 sPD21eW4Vq8+/Z2v9FucKCWvKknUjmk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 phishscore=0 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180072

On 26-08-11 17:09:00, Dmitry Baryshkov wrote:
> On Mon, Aug 10, 2026 at 02:10:38PM +0300, Abel Vesa wrote:
> > MXC and MMCX were initially omitted as they were believed to have no
> > consumers, and they were not present downstream either.
> > 
> > The Iris video codec requires these power domains, so add MXC and MMCX
> > along with the MXC_AO and MMCX_AO.
> 
> Is the display completely sitting in the MX domain?

Sorry for the late reply.

Yes, it seems display is in MX only.
