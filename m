Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E8D341650
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Aug 2026 09:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787997394; cv=none; b=usdHNHMR9jdquhOoeTYWK7ZxV2WHaT27VMeolHgLi9gxg75F0ICPZ4osCgx7RmHb3tpnfGDALxr+CLjLXT2oDWFwQJ6XXC/IAZqYfrkJN7W9tGn3wUJgQLalgBjE2fQqBe1S6NIdBBm7V9k3enE6EGI1CVYCC9gkCLamJgqXMXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787997394; c=relaxed/simple;
	bh=0WmC7NobsOauCrIbqv3KL2l7l4BaPEQF473/kYGDurY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NNr8gvqrh76kpZK7g7GAJ/5KDj7VOy7rjM/ubrYBnxWumLyPaMV1ch4BlsAC+8wNa8jROsVtPZdZktAcpWY3+R8FGRF5Nsk+XVsGr6TWtz/+1Fkk2dad8kcWki6cEBqa8Lfqrz/nC+V0WxLxfxD+u4utlQlFaE7UHu300Zqem4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MnuS6kgJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HmiqCxnd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MnuS6kgJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HmiqCxnd"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67T803Gf1687264
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Aug 2026 09:56:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sMP0XaepjPlmJbxsbEQ8szt6
	2Q73GNx5xhfDiowpknI=; b=MnuS6kgJNx/2HsQlolerc4EDXhHZG3qcndfYEFII
	PQHhc3GkXA5PQxOhbczI+Wv2Fxyfc+XdNds3e/qkdTgDjRtZe1OS0XqCX4CRfbEq
	A4gLEz38bnlI5JWJkbpOvtrfqBkf7k+JKUmC6NGaM0Kkat18lXwZB39U3SAFCIal
	50n0q9h7v1hukZs9SihAHSpej31ojGlUde0gHgiW7D8BUtnLVEKHQWF4uZ6f6cpp
	0DNpyAfa6aGgYFMJDgfBHaNTTujY0N95Ga/F7KM0rz6L9XY+gLoBxXLKFv8TeWGa
	u4Oztfr96Kb6yi01KRPsABAnN0m6svTM4Uge9u43TwvwlQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqdvgp7n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Aug 2026 09:56:32 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbb20f82a0eso1629363a12.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Aug 2026 02:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787997391; x=1788602191; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sMP0XaepjPlmJbxsbEQ8szt62Q73GNx5xhfDiowpknI=;
        b=HmiqCxnd+Cox8R7Xla6R80jnY8t0MkPm0q1UxB+eQJRlaELPxvlbrs+ze1Nx4Exeqr
         c+br2GxNPGmf6eG4VXAGZAwJOW3G1AGMQYXjtKPClwwDhpPpuYoLPWvh734lpTOpw4CH
         h6LKqVzGGcl7jU9YXp5aEooiySp0Q7JLcWiXAwiOqfc6OBdV5MLpi3WIHpf0W24UJRXl
         H7hSK5qe7cGlsRKavvNjKQSU7n12xbbHkaWdbRyo2XpVWTmPdJVQa2X/V78xG/xkDG0H
         dOGG+Xjd2/pRSd0hkVUZ19CnuLC8+DNZ5CZuh18gZz5jqRYMl5WJXg3CUkwAQvimZeBu
         S4OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787997391; x=1788602191;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sMP0XaepjPlmJbxsbEQ8szt62Q73GNx5xhfDiowpknI=;
        b=Tl/thQK0JbbkKJtQ24vQ6et1xFvtysWezUxy4M9jpnunTOiiZwUsnXpMJBobbj9I9P
         /Y5BGecE2fvYGXbBrdjQTW3URjACkcd+Otr/S/OXeDIeQzEQtGk88deAl8peX5/uLpDq
         Y91e5RvpOvxkWAJeG3uuLPo3thtM73Lohp87Rv5peyUZ9y9bP9eb0aUU9zOzTGH4fdJ+
         Vm90mRVidh5eYXJZxFpcgC+StaARsvOMEWqni4WAvwubDg0P4gS+Y4sFqoosN/3P/6Yj
         OhmMCPNS4dovb+u7vg6jgXf1kf70m5LTIXYXJSeIpuFXT6TfiEslLMKsOVqcadlHaC8u
         udeA==
X-Forwarded-Encrypted: i=1; AHgh+RrtL48yTpogXbNJn2vgy/tRWscFmZrWCqQN0RX0k7F969ane0Uc+pDA3EjuqN+ro89zP4bmh2v1LmIdMvV5@vger.kernel.org
X-Gm-Message-State: AFuF++l6LuXMqKUtOPuex8NtCoHm69g9KSH+E2RcE1XpwYF+IygEAnKp
	GjhV2bhcOFeyxuUBth4/dWFwzs8Wu5Q43zutXhFYspeTbCvovKQtSFUT4Nbiw71oZkr9Sty5WMF
	nzUIf+td86drX5qNgr/mnIdZmec92/rOHbNdgAx1khTzn9MvfY8Qt/fkYkgqtx4WE1hQg
X-Gm-Gg: AR+sD13uyi/TSaKruNzbmDYe1HsSi2M2/b05GVdjcMIB1xS9/Zo3pkGEr+nJiBz11q2
	gBcqjt83rexthoXFonsVQapbrCSNwzn0himeJ8rIehBPbyKPjs6OTdiduIJASUUftFgje9V/Wck
	b3iQv5jsbilC4+7HkkkHTeootG7W9zN9XJtIX7N62wU3ti+0PjeZgxLir3ColgFmqOGRyPBVL2p
	ftUjzDlY3TYqb8Cnuwb7YXXb3SKfa2BzL/60HayqHM9Bo1IeJDJCnzkkdLQXJw5s6eqHZzJC9ZO
	N4JmLzyziZJO/GcE1vd8JpgdWAhWn7LRPVNZARoLLOMxKPgASTo97va4hFU67C8shAf81Ztml1j
	4myP1ktKDLAhcoTvApdyB6danO4WIBUpjlEpqmjENBsg=
X-Received: by 2002:a05:6a21:4014:b0:3d3:af44:ee11 with SMTP id adf61e73a8af0-3d3af44f155mr8533803637.26.1787997391344;
        Sat, 29 Aug 2026 02:56:31 -0700 (PDT)
X-Received: by 2002:a05:6a21:4014:b0:3d3:af44:ee11 with SMTP id adf61e73a8af0-3d3af44f155mr8533764637.26.1787997390926;
        Sat, 29 Aug 2026 02:56:30 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d4b336sm13992370c88.8.2026.08.29.02.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 02:56:30 -0700 (PDT)
Date: Sat, 29 Aug 2026 17:56:24 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Guenter Roeck <linux@roeck-us.net>, Vinod Koul <vkoul@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thermal/drivers/qcom/spmi-mbg-tm: Import IIO_CONSUMER
 namespace
Message-ID: <apKsyKdePJ3HKT2N@QCOM-aGQu4IUr3Y>
References: <20260827103555.883018-1-shengchao.guo@oss.qualcomm.com>
 <apAzGkXpnMYHcnqJ@ashevche-desk.local>
 <apBLL4x0h2kUaz-n@QCOM-aGQu4IUr3Y>
 <20260828234249.0c729e5e@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828234249.0c729e5e@jic23-huawei>
X-Proofpoint-GUID: af9629h0OaV7ILpR2oYbbN72KkGFc4Ix
X-Authority-Analysis: v=2.4 cv=P6EKQCAu c=1 sm=1 tr=0 ts=6a92acd0 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=YDW5RsgNVoE-659JHf8A:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDA4NSBTYWx0ZWRfX802uNewZfeKD
 0Ezfz/GO6t4QJFs6ePfyRmhe5JNKtfBLVAh6GsBJ+UjIymYqiyjBrCDVkOB06qZr8ZCamEtqMvY
 vFGL7H0uVP9oUBorpSEfBRcNPi+5Q9SmdlrPCImE13TfTIzot4TeUSysNT/kZEivIYxqXmepyu5
 sT+3MdD7kUS/4Eo/6ykKm1ETOaiv7qtKUm1cvSPduEMjPXAbMiWgt4zdTIJ9YmM0DwzWYtGZ1p6
 N8VNZqIKBbBtzm+toWIygTFIWOZlwPMXP+75s6Wmunc2LjvFNVHmseE5mlK0ekjveusSAaPV85X
 ybq4cTE+nOlnnzWRrJhFHvhV3kGvPeAN7/JumDl7VeJ0nqHFpy8zeB42m0R0fp4LUvVQVLe+k89
 ha4dQWESmlYqZiPNeUdEfinJu0A9mpPojIa2KCScX5b86rsX6fG0r7OZQj5ygGwbKlO49RUEn5V
 L6EWW8FDjiJGWb+My9Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDA4NSBTYWx0ZWRfX69r8TXd7HWFl
 DygqlqpffvQOiVR1LNTa9XBjIv66/m1eGYtcqWpWfjjYy6tIUVZ1B/Lfq4MjSfaARN6cOrhpSBt
 AZukuGW4muA9wfF3scqTpFLBGmLvhQs=
X-Proofpoint-ORIG-GUID: af9629h0OaV7ILpR2oYbbN72KkGFc4Ix
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290085

On Fri, Aug 28, 2026 at 11:42:49PM +0100, Jonathan Cameron wrote:
> On Thu, 27 Aug 2026 22:35:27 +0800
> Shawn Guo <shengchao.guo@oss.qualcomm.com> wrote:
> 
> > On Thu, Aug 27, 2026 at 03:52:42PM +0300, Andy Shevchenko wrote:
> > > On Thu, Aug 27, 2026 at 06:35:55PM +0800, Shawn Guo wrote:  
> > > > The IIO consumer interface symbols moved into the IIO_CONSUMER namespace,
> > > > so consumers must import it explicitly.  Without it modpost fails on  
> > >   
> > > > 'iio_read_channel_processed' and 'devm_iio_channel_get':  
> > > 
> > > iio_read_channel_processed()
> > > devm_iio_channel_get()  
> > 
> > Sure, will update.
> > 
> > >   
> > > >   ERROR: modpost: drivers/thermal/qcom/qcom-spmi-mbg-tm.ko: module uses
> > > >   symbol 'iio_read_channel_processed' from namespace 'IIO_CONSUMER', but
> > > >   does not import it.  
> > >   
> > > > Fixes: ebf1d03dab96 ("iio: inkern: Use namespaced exports")  
> > > 
> > > Shouldn't this be backported to stable kernels?  
> > 
> > The offending commit just landed on mainline during this merge window.
> > So there is no stable kernels concerned by this.
> 
> There is a fix on the thermal tree. I though that was enough. Maybe this
> races with that fix going upstream?

Ah, I see! That's a fix from Nathan Chancellor. Ignore mine then.

Thanks Jonathan!

Shawn
