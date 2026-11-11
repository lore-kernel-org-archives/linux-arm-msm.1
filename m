Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794403864;
	b=JmDekmEwnufSq70KF5FybHBpzd9B9LpEr3Rqwk0Qvc0SI+5pUr/gw6f8RHsLvVvzek10
	 2mUJNWdhiQZdfG7S8LeCK355W/N9dXxxLBpt+7xlBxKnsjfTuj+Od3+4VjyYL72PuxvGn
	 au0sgt56xGrA114evnYsCj7XQeKJwBFesVBh54sqV7Hmcj2IPexNuRfYj0sI3QFoDcn79
	 Y8J3/0VGOABN2T26fHAbsRNhfCMYHQPLtooHLFw509uh1/Gii5DwWioCfcFX4u/znegpz
	 3sjS6sWPa+Z+SE9pRiCHjUMB/LTVFwBFfK7Ij5Ir35UOAuRMLbQnhTRDM003pPv8isw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794403864;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dxj1xubJ7YfRpFCHJdR6Gg9jjbHeiVgUIcmm1aUVPG8=;
	b=f0M2rYJgzvMdcoEJOLgtb/3HNXXhUEBhUwgmL0JXQaDXYEyuBTSW6XEtXMljZZAC/dTL
	 BryGrHC7E5R1Uevj8w9u+arW3fFR1nrQlS1HQEAxKQ84gubIW15h0BawFWpBzbHoRgNhM
	 s7OJ/RtbmtJD6uE8w078SyA7HfmryFAMyZA5/8D9Iz4ZA1CF7Vjy7stjH0Bkd0pvJuFpQ
	 gKNp7Au32OFzmS1wTXdcRQJLvbil7oSKuubxSoFNrUqcdNHHW1Pkh6xtdJXUOof1xNw4C
	 49lF7BXlNvbKc3Iy4p+vivTXgnXIF87ieYOUD6uOqGr2HBvITlkdgx82U5szC5Ilocg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bRXd5l64;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=apsjnk2X;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF1D606A321
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 13:31:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AF1D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bRXd5l64;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=apsjnk2X
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCYw5g1806606
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 13:31:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dxj1xubJ7YfRpFCHJdR6Gg9j
	jbHeiVgUIcmm1aUVPG8=; b=bRXd5l64IZARXIj0DgPF2TFExBKvqmSU/EfTGK+R
	QtBw4xh5sWHUL8WVwnLKYlCH631UjzHdjNsSEAbwp+htcZDHmEu+Q2tCb18riIZr
	GiTy/zm3fAK62HxVlUhA0pKJwdoiGSmz51Pdw9cHgmXtBUn3kNemUPNWTcss1/cN
	AksXqgOEpwD91tKkap43R3DmCByoBBIdvCNYh0l+pMbgLpvdO8dy4v4hZY2dRIiR
	1rS8NnyfykdNMYSZVEJVONrl2UMfwv912qibCV5zr1ydD6jHqN4bd6t47clIfey5
	B4ch6JiMdZmsNV5TSamWs0R2W85oh08/mquyi0u7HobOPA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvfawjacj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 13:31:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f559420f3so371708385a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 05:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794403862; x=1795008662; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dxj1xubJ7YfRpFCHJdR6Gg9jjbHeiVgUIcmm1aUVPG8=;
        b=apsjnk2Xq0usWokUuSgUuAAlj0PLSJsf2x3/E+ZqGoq7d2wvdgn+/60WNyYVxi9Y0D
         fGLj4+da6NhesEcgIi3mZ/qZ9I737llHHRQJ9tGrb2JckBTQCvbjCPbS8niteE0VyOqF
         VxS28GgUSipWGpkFBqNJxGHFJ99kTpWBzIAq/SJzy4haCbol8gDIARfqKh68q+Tesmsx
         PropQKjru7WZM4ZJtwAbjDUKGP+Yaqh9Gq8vtA3LOjmfN8FifV9VtHFam6jWVV8w660R
         anSLXf/yrUgIWJVIYjAsjYLwJpodBsdIGTX+WGT0/OJdS+Kkhc+zrIwByv0y0h+2ffep
         xWvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794403862; x=1795008662;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dxj1xubJ7YfRpFCHJdR6Gg9jjbHeiVgUIcmm1aUVPG8=;
        b=nJOgmmlUurV7BND7W92icED7yqbd05aXgdjNI6AMyBtHkn09a2fqZt23vcIXytokLP
         FVdKiCRL8ov0LHlzSHjqRGg9tfXluSaR9BcYcqYzAfqHGX+aUIRLYW/FqZr2S8JrfRQL
         dcwC8gTt+teVvQQFURL/FvrpAMIjgRNuM5GhoDaS+/UzuB7kB7zLDdZ4ykxZumH+ZqgR
         zKqjfECVhD1qmCAdgo9Imfqt/z/WIHncHR9jVM8hIh4pznMKOgrGAHxeA3xd4SVbz8/l
         DmIbUNEOs0C/q0ZzF0BN/8mahTeFE0OAl+udRtLWHH3VrynnK2iFxHWPcQ0Rffo7oCHH
         uL4Q==
X-Forwarded-Encrypted: i=1; AL+hErHb6yJ38qtGW7A4tonyYFMzxQKbyS55ZKmG4NoqXv/+3nJi6y529mEy/OhIRdNYlazSKkkKyPd7VITeswd2@vger.kernel.org
X-Gm-Message-State: APuU4Z8HlreP7EIHe0Wf3sJLe6CiuIO7bSEWBVXaYQVrK0qovAkJQuNr
	xYevri/ROXMLw0I8/B/QDgpg0TN6PFlS2brDZWqsoU3G3Lhp0JwPQ6TfS+otWhGm6S8Ke+/JHzH
	E660hH6gdnVhYIoc0FrnTyz0/OQ/RlmG33RcypMTjLPWtzrSwPYccu87iOZmIejD7nO54
X-Gm-Gg: AYBFou1WNwZ0gc9vuuNallCK9Rbva/Fd1rANatw8TnBxHpxqOEjLiveqe24m01Qb+w6
	Ak6Hib0/Bl8KXnpsfe8Bgwa1OQHFOzUxsqXDaWZN8EsskAM1Q9yotqmKwRMs7Hpm4jTeszz7rri
	TB38YPJnwJh0QKavQdHtMPKL30CE7/UzTt1x9SnsOsb3G1RUVku9wTg2E8/HPeYlggZS9LsogEY
	VRLoK4OlZe0Q9I/YW43CwtcMaLz9MLvlqVio0iFe4DlImUUOkZ99dt67HOsCBSlDI2D+t+yunC0
	faMqJ43GktEcGiWP9PFRyrdLA975+jEa2nOojfGoWeSZ9G9PQIRrP4ZFFvMqNJN5/nks7G2Nuvc
	Pc3i5lkMb5LodMKTITGoBjGqQc4Oz8T8L8CtSc3HNEs4l7jNf+CwERYwlc4Eagq65VOELQeLrt7
	84c/7uA3SI7s5qKeZf4Avo1EnNw7DDMv5UvC20bx8XtpJ8U8MwfOva6jwOpVTEqA==
X-Received: by 2002:a05:620a:a49a:b0:947:b201:fafd with SMTP id af79cd13be357-947b20238c1mr253957885a.33.1794403861722;
        Wed, 11 Nov 2026 05:31:01 -0800 (PST)
X-Received: by 2002:a05:620a:a49a:b0:947:b201:fafd with SMTP id af79cd13be357-947b20238c1mr253948185a.33.1794403861046;
        Wed, 11 Nov 2026 05:31:01 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c157bab08asm988415e87.32.2026.11.11.05.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:30:58 -0800 (PST)
Date: Wed, 11 Nov 2026 15:30:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, loic.poulain@linaro.org,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 3/8] media: v4l2-jpeg: Add a baseline JPEG header
 writer
Message-ID: <qb6mqteoxdk7xb7qhgiruncdamptf7m62m3y4zrccs4cesxr4t@q3oukzsd6qyr>
References: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com>
 <20261110163909.78085-4-atanas.filipov@oss.qualcomm.com>
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
In-Reply-To: <20261110163909.78085-4-atanas.filipov@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MyBTYWx0ZWRfX6O+BmlI2PRku
 5kWs3k+X2G8s0p3f1NzkVuxpc8x3aJ0GSXvs0YQCF0wY2ehQ1YoCbwG3QHiXd5y7gaVzZ87yUyf
 9lEWfvAI3mRK9u+jc+vg1pmKgWQhTkU=
X-Proofpoint-ORIG-GUID: YjBr3SdevSnAFvFOiDkSiuRbzxQD2ihf
X-Proofpoint-GUID: YjBr3SdevSnAFvFOiDkSiuRbzxQD2ihf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MyBTYWx0ZWRfX/Oc5Y7a0RN/y
 46iLrd0pKHHNZlm/KwjIxIWvJa0ZA8K43VOoH/884Km7EnVlqXgMya0Kd+dwkFecB/jaP4kEpEY
 mHPTcJcXUVpDBSk+SeHNFdtAYv2Hn3hUzgor7z2hymr0XY3aMvvHx7Br8sPzEGf2K00g7yiKP2v
 lRhRmS7327M4CUp7LtohV0WjTztigcwOg/sfguJE47OtxlyLFryEV4XNYBWIZ3fpBJjicU2UF+7
 QKjSYil/cr99Ny/FmF+fHnECUOgHJevAOXdglkpjIA707YasFBBaRj5OVCk1jBvilEsEFAWghEN
 G6TdS3xhuRtIcsYTbb7uEVx8muxLU3W2IKZ3UKWzMhA03wtoM9UVTvgyJUQyznWRpTGNajrY4OX
 mF5ocaudWmgyCtaQeWAzccxs3uy9w5MryQPBc7Uwu2CQH2TxAcnIAfLgdpKMEU0vEYNRQBCKshs
 8MpPKF8dCKjzVcIhglA==
X-Authority-Analysis: v=2.4 cv=CZadd7rl c=1 sm=1 tr=0 ts=6af46e17 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=8L9HzTLjaCIjMRCGOecA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110053

On Tue, Nov 10, 2026 at 06:39:04PM +0200, Atanas Filipov wrote:
> Several V4L2 JPEG encoder drivers build the JPEG header in the driver
> from a fixed template and patch the image size and quantization tables
> for each frame. Add v4l2_jpeg_write_header() for the baseline case: it
> writes SOI, an optional JFIF APP0, one DQT segment per table, SOF0, the
> ITU-T T.81 Annex K reference Huffman tables in one DHT segment and SOS,
> and returns the offsets of the fields set per frame. Add
> v4l2_jpeg_hdr_set_size() to set the image size in such a header.
> 
> The field values come from media/jpeg.h, so the driver keeps only the
> hardware specifics.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  drivers/media/v4l2-core/v4l2-jpeg.c | 165 ++++++++++++++++++++++++++++
>  include/media/v4l2-jpeg.h           |  31 ++++++
>  2 files changed, 196 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-jpeg.c b/drivers/media/v4l2-core/v4l2-jpeg.c
> index 36a0f1a1b0d97..f466dc6a457de 100644
> --- a/drivers/media/v4l2-core/v4l2-jpeg.c
> +++ b/drivers/media/v4l2-core/v4l2-jpeg.c
> @@ -13,7 +13,10 @@
>  #include <linux/errno.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> +#include <linux/stddef.h>
> +#include <linux/string.h>
>  #include <linux/types.h>
> +#include <media/jpeg.h>
>  #include <media/v4l2-jpeg.h>
>  
>  MODULE_DESCRIPTION("V4L2 JPEG header parser helpers");
> @@ -711,3 +714,165 @@ int v4l2_jpeg_parse_header(void *buf, size_t len, struct v4l2_jpeg_header *out)
>  	return marker;
>  }
>  EXPORT_SYMBOL_GPL(v4l2_jpeg_parse_header);
> +
> +/* baseline JPEG header writer */
> +
> +/* Segment length of a header struct: the marker is not counted */
> +#define JPEG_SEG_LEN(hdr)	(sizeof(struct hdr) - offsetof(struct jpeg_seg_hdr, length))
> +
> +struct jpeg_hdr_buf {
> +	u8 *buf;
> +	size_t len;
> +	size_t pos;
> +};
> +
> +/* Writes past the end only advance pos; v4l2_jpeg_write_header() checks it */
> +static void jpeg_put_bytes(struct jpeg_hdr_buf *b, const void *src, size_t n)
> +{
> +	if (b->pos + n <= b->len) {
> +		if (src)
> +			memcpy(b->buf + b->pos, src, n);
> +		else
> +			memset(b->buf + b->pos, 0, n);
> +	}
> +	b->pos += n;

Now b->pos has advanced past the b->len. Is it expected?

> +}
> +
> +static void jpeg_put_u8(struct jpeg_hdr_buf *b, u8 val)
> +{
> +	jpeg_put_bytes(b, &val, 1);
> +}
> +
> +static void jpeg_put_be16(struct jpeg_hdr_buf *b, u16 val)
> +{
> +	u8 data[2] = { val >> 8, val & 0xff };
> +
> +	jpeg_put_bytes(b, data, sizeof(data));
> +}
> +
> +static void jpeg_put_dht(struct jpeg_hdr_buf *b, u8 class_id, const u8 *table, size_t len)
> +{
> +	jpeg_put_u8(b, class_id);
> +	jpeg_put_bytes(b, table, len);
> +}
> +
> +/**
> + * v4l2_jpeg_write_header - write a baseline JPEG header
> + * @buf: destination buffer
> + * @len: length of the destination buffer
> + * @params: header parameters
> + * @layout: returns the header size and the offsets of the fields set per frame
> + *
> + * Writes SOI, an optional JFIF APP0, one DQT segment per quantization table,
> + * SOF0, one DHT segment with the reference Huffman tables of ITU-T.81 Annex K
> + * and SOS. Width, height and the quantization table values are written as
> + * zero; set them with v4l2_jpeg_hdr_set_size() and through the
> + * @layout->dqt_offset offsets.
> + *
> + * Returns 0 on success, -EINVAL for an unsupported number of components or
> + * -ENOSPC if @buf is too small.
> + */
> +int v4l2_jpeg_write_header(void *buf, size_t len, const struct v4l2_jpeg_hdr_params *params,
> +			   struct v4l2_jpeg_hdr_layout *layout)
> +{
> +	static const u8 jfif[] = {
> +		'J', 'F', 'I', 'F', JFIF_IDENT_TERM,
> +		JFIF_VERSION_MAJOR, JFIF_VERSION_MINOR,
> +		JFIF_UNITS_NONE,
> +		JFIF_DENSITY_HI, JFIF_DENSITY_LO,	/* X density */
> +		JFIF_DENSITY_HI, JFIF_DENSITY_LO,	/* Y density */
> +		JFIF_THUMBNAIL_SIZE, JFIF_THUMBNAIL_SIZE,
> +	};
> +	struct jpeg_hdr_buf b = { .buf = buf, .len = len };
> +	unsigned int nc = params->num_components;
> +	unsigned int ntables = nc == JPEG_COMP_MONO ? 1 : 2;
> +	unsigned int i;
> +
> +	if (nc != JPEG_COMP_MONO && nc != JPEG_COMP_COLOR)
> +		return -EINVAL;
> +
> +	memset(layout, 0, sizeof(*layout));
> +
> +	jpeg_put_be16(&b, SOI);
> +
> +	if (params->jfif) {
> +		jpeg_put_be16(&b, APP0);
> +		jpeg_put_be16(&b, sizeof(__be16) + sizeof(jfif));
> +		jpeg_put_bytes(&b, jfif, sizeof(jfif));
> +	}
> +
> +	/* one 8-bit table per segment, luma Tq 0, chroma Tq 1 */
> +	for (i = 0; i < ntables; i++) {
> +		jpeg_put_be16(&b, DQT);
> +		/* length field, Pq/Tq byte, table */
> +		jpeg_put_be16(&b, sizeof(__be16) + sizeof(u8) + V4L2_JPEG_PIXELS_IN_BLOCK);
> +		jpeg_put_u8(&b, i ? JPEG_QTABLE_CHROMA : JPEG_QTABLE_LUMA);
> +		layout->dqt_offset[i] = b.pos;
> +		jpeg_put_bytes(&b, NULL, V4L2_JPEG_PIXELS_IN_BLOCK);
> +	}
> +
> +	layout->sof_offset = b.pos;
> +	jpeg_put_be16(&b, SOF0);
> +	jpeg_put_be16(&b, JPEG_SEG_LEN(jpeg_sof_hdr) + nc * sizeof(struct jpeg_sof_comp));
> +	jpeg_put_u8(&b, JPEG_SAMPLE_PRECISION_BITS);
> +	jpeg_put_be16(&b, 0);		/* height */
> +	jpeg_put_be16(&b, 0);		/* width */
> +	jpeg_put_u8(&b, nc);
> +	for (i = 0; i < nc; i++) {
> +		jpeg_put_u8(&b, i + 1);
> +		jpeg_put_u8(&b, i ? JPEG_SAMPLING_H1V1 : params->luma_sampling);
> +		jpeg_put_u8(&b, i ? JPEG_QTABLE_CHROMA : JPEG_QTABLE_LUMA);
> +	}

I think it might be better to write explicitly:

	jpeg_put_u8(&b, 1);
	jpeg_put_u8(&b, params->luma_sampling);
	jpeg_put_u8(&b, JPEG_QTABLE_LUMA);

	if (params->num_components != JPEG_COMP_MONO) {
		jpeg_put_u8(&b, 2);
		jpeg_put_u8(&b, JPEG_SAMPLING_H1V1);
		jpeg_put_u8(&b, JPEG_QTABLE_CHROMA);
	}

> +
> +	jpeg_put_be16(&b, DHT);
> +	/* length field, then per table class a Tc/Th byte and the DC and AC tables */
> +	jpeg_put_be16(&b, sizeof(__be16) + ntables * (2 * sizeof(u8) + V4L2_JPEG_REF_HT_DC_LEN +
> +						      V4L2_JPEG_REF_HT_AC_LEN));
> +	jpeg_put_dht(&b, V4L2_JPEG_LUM_HT | V4L2_JPEG_DC_HT, v4l2_jpeg_ref_table_luma_dc_ht,
> +		     V4L2_JPEG_REF_HT_DC_LEN);
> +	jpeg_put_dht(&b, V4L2_JPEG_LUM_HT | V4L2_JPEG_AC_HT, v4l2_jpeg_ref_table_luma_ac_ht,
> +		     V4L2_JPEG_REF_HT_AC_LEN);
> +	if (nc == JPEG_COMP_COLOR) {
> +		jpeg_put_dht(&b, V4L2_JPEG_CHR_HT | V4L2_JPEG_DC_HT,
> +			     v4l2_jpeg_ref_table_chroma_dc_ht, V4L2_JPEG_REF_HT_DC_LEN);
> +		jpeg_put_dht(&b, V4L2_JPEG_CHR_HT | V4L2_JPEG_AC_HT,
> +			     v4l2_jpeg_ref_table_chroma_ac_ht, V4L2_JPEG_REF_HT_AC_LEN);
> +	}
> +
> +	jpeg_put_be16(&b, SOS);
> +	jpeg_put_be16(&b, JPEG_SEG_LEN(jpeg_sos_hdr) + nc * sizeof(struct jpeg_sos_comp) +
> +		      sizeof(struct jpeg_sos_tail));
> +	jpeg_put_u8(&b, nc);
> +	for (i = 0; i < nc; i++) {
> +		jpeg_put_u8(&b, i + 1);
> +		jpeg_put_u8(&b, i ? JPEG_TABLE_SEL_CHROMA : JPEG_TABLE_SEL_LUMA);
> +	}

The same.

> +	jpeg_put_u8(&b, JPEG_SPECTRAL_START);
> +	jpeg_put_u8(&b, JPEG_SPECTRAL_END);
> +	jpeg_put_u8(&b, JPEG_APPROX_HIGH_LOW);
> +
> +	if (b.pos > len)
> +		return -ENOSPC;
> +
> +	layout->size = b.pos;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_jpeg_write_header);

-- 
With best wishes
Dmitry
