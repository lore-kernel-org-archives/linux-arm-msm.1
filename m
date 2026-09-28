Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C323459ACB
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 08:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790582805; cv=pass; b=QdmcbHjgMgMcnxiPwZ8o/bu7IOd/HzcNCL/ca71JIa3YQR4vKpc1n710Fv4z9oH5mjJCyhkjXekmKZq0CHkTX/0f1GBVQyYjtJqgU2m68VkWHpxDaHOSx4HLiBRfjWBlL6Kh2V4++GJBjBDby4739bW+Py54tDYu0GaZH2fopKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790582805; c=relaxed/simple;
	bh=FKEyW8n2U9+lhPaV6HTQ4Z+XZRDk95eDypyZkwsJuw8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nBIwEdEJOxjSUig6TTKYm2Bf5LdQkT+qbm9/p0qdjQ5x3L33ma+mBlLsqp1rO5X/dBl4wldRACN4NB/LRG57n/Z326kO4gus/0LnnJ6wSGZ2tdVMIKlCwqn/g+Wnqh/EUCYWTqoVa0gAnrtll31X/QxFVJBvYpzrnQEOZuBK+1c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ofwyh+C+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JcJGRuhh; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ofwyh+C+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JcJGRuhh"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S7xTt6062707
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 08:06:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xt0oKaJn67L4g+z8bImQqIhwIKc+sBHmTKsF2G0Msd4=; b=Ofwyh+C+8B+f9sv0
	ET4ehK3OF3LjEpRt5MNHvr8J3x4MOPHly0e0qJCSrlMQLMAAlWCjkp1PRM4wAesz
	i9pTJjuJYB9C8KIBQxyVvR4jj6TnT+n6tAS+1DN3zUZoy1tOJNv2AzmH0m1CtBV+
	wwo7nUJGCP1mBPNjXQnW2gI52S8RUDMY7dofnX3PiEtpSVRs9HIoBaAXckeD35u7
	SAVoS2FiPhy5IzzzJFXQFnChRU5uQFV6DXGg8Kow51UYVz7nze53eWChg57gzG2e
	JQbXnTvEyo9BHTIvFyOJ1oGGXH0fluea60eaTZUxF/G+77Mgr82WynoZrPWPLTOy
	QaYqwA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyjt10cee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 08:06:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a183a0e93so613088285a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 01:06:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790582802; cv=none;
        d=google.com; s=arc-20260327;
        b=X+3IfCdKeIqYjnRiyBg43VIG0lSMqTDJCuZdXWbfriTNcQsxBBsrI1TttGzLRWS/PH
         WOsPS8W7kkSExGyao/lngd4wN+ZOcQx3ZidS4zoBFwtj97bgVGKoNezh9thVIlBEXeGF
         UcyI2iz/Ub1MNVRpxDvIQ8JqSFsbK+nkzwemhMMicC/9qFMbR6m5xm6qNyHRFuuER388
         fGra1ejqk9UDl+uuBGLeWyyNaBA5iF8T8Fyh+uXbIH27POZexJi4kipVDsOWoCmxzGFR
         tC3LL1lI6PTmc71JziTnkZML2afGM7RJ5d5KmuBf7ykv42SMHMyDGLvvnzPkIJCzlAJ2
         8Y8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xt0oKaJn67L4g+z8bImQqIhwIKc+sBHmTKsF2G0Msd4=;
        fh=7rIPuGbETMwgWl2Goo6oEzBSamZby8rbYW73hSLr0ps=;
        b=dEU7l7oNx3b0dFx94OYN56RVlvJ5bU1W/2nMa9d4+QGUcU/sW5Wy8MIqZDbi8z7nBt
         N62mOUtYHvlVs3kUiR8DW5tTbmtGSKsih15kg3lopPHe2gX1k80GOAmfnGXe0M186jLk
         J0AlhbvVIsFevbS+fhYFm2L9wpIKkZ+YiIFWTsnfGDpkbNMatTrYfGmqqPdJEvXaRV+0
         qH9PXAC81EMedVIJ6E9sklKnQJXr9yGS9KxiLg1ZbFvJsXUjfmrM05VqjANCfhiSltey
         +Uo6uozY4YACt5vCQNtHIdPSxFOHZCTTGRiLwEziQLVSTfSOW9KvyP4a6WUHErhS8V2F
         7Adw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790582802; x=1791187602; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xt0oKaJn67L4g+z8bImQqIhwIKc+sBHmTKsF2G0Msd4=;
        b=JcJGRuhhpQ8dEqXTJpu23TYg9KkGbmiDz5OW7q4OqJ4QH8JpdDonKGQ4MX79lmO6Ea
         FRqIu1kHku6S5yDtKgj+vnxZ4fg2z2Rs4WZwHmK5WxbLMBL8zSsCV+P5mEY7cdNmalzL
         RqnxnQChOXBZRYKqqWBjYnhL1hEhYQDnVvdo2xWa+LUnGwd061CuozhcVz73itebnsMe
         zuyRtqHsbWM4rXj1TIKCq9iEsnc0k1ZnCsA73Alf/ZBm/azJyXEcbiT5JCTDUqxHh1v0
         vz4bKKkJ0ZmTuciZ3e39kQl1v4dK4wdPpAbsZkEG0aWoxqpX9HOVsdRdW0fcwIAa18wg
         WEXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790582802; x=1791187602;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xt0oKaJn67L4g+z8bImQqIhwIKc+sBHmTKsF2G0Msd4=;
        b=lbeu2OX0FDZmXHulAOhYyeqQPh5ay+k15ePuEK7sEekN30/LWdVsfp5rTfeW9myWox
         MCMUXydwMkAoR7glRBAs19BOCpWgThezqr6sc9GkDpoE1A6wdvvGnqOqYR9KhYyHbOzn
         hm0nsVPVXbrtXrY135nQkHjbAWJSAmTPKynX5dJBwfYhg3g/Hf7escwmUl04sSTFey4O
         5O/n9hL0l/vaZeKFCQ8xEeU8pBATlAK5DVGXxSowwXek0hzHsXtJUreEGSHXzLUXYbA7
         IbXn9SGUTSv9nwUip7xSIptBCwcXVjWhUhYqkvqR8mILBGfzuriDyBi0YHsedCOALIS1
         UPOw==
X-Forwarded-Encrypted: i=1; AKwUvBwMs0S4A4XTibjgRqSpeeXHr3yOpxWbNB9O5NgLeA6QPSFSJ4DA0JPApKzO0c8LuW4nFTPJ3hyWi6sJ7jyn@vger.kernel.org
X-Gm-Message-State: AFuF++koE2mHJvUb2TuElLBEnEB9DyZl93MJY5PMV7j/OyCq7qz6eZNf
	Hv80SezWKvAnay+29lXgIYEgTJEk4yfeNlFnSmieOn7Q6KN3DD8vF1oOXi1NZzmaqi483olVoQl
	d+aTZAcM5lWChb+MtrSm8Vai0wGoOtY1OZ9gl4flFEs9QbMM8XVUB/Znu48Mnm47rlGC2pOLmyH
	vlbGwTQOcKw2nsp9NpNJgsfJC4WNKiAQxZ3ZnYZ4coFqY=
X-Gm-Gg: AYBFou1yhx2kr6VGeU86BG3JIpRHRYMMknZUAOt/tD3VsAZN3nfEip+D3nXx6HCKCRT
	W91AWhBNKZquxacD/I+cy723KyT6MauHLXVdygDD7KA0v9ZrFmkRGjYX9dRCVfp+Dw/BnAlGIUt
	nH+w0nuoYWwd8vjnJOxr7Q54GFBrGHl0J7zafAtUjjOu1gqzphDzQKEK8svi5f9ObizDAju56hv
	6Jw9QfHK7p4cEz7uirPagCG+/gB12H6LuAASTBRoDN0VSDloUVJfOD3C5XMHnuSPsC6qdtPqMo=
X-Received: by 2002:a05:620a:a0c6:10b0:93c:8544:6adc with SMTP id af79cd13be357-93c85446be8mr36309785a.18.1790582802138;
        Mon, 28 Sep 2026 01:06:42 -0700 (PDT)
X-Received: by 2002:a05:620a:a0c6:10b0:93c:8544:6adc with SMTP id
 af79cd13be357-93c85446be8mr36307185a.18.1790582801653; Mon, 28 Sep 2026
 01:06:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928064336.272659-1-hitesh@ebytelogic.com> <20260928064336.272659-5-hitesh@ebytelogic.com>
In-Reply-To: <20260928064336.272659-5-hitesh@ebytelogic.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 10:06:30 +0200
X-Gm-Features: AclHuK82SWDZ4KKfAyhBngt9t9lHZQRpPUH9qSpCVj0bK_fMYfXekUG5njetwpQ
Message-ID: <CAFEp6-2Ra-JjoZgR0_RPU5mRgZefaWqb1F_HMLxubcSeHbdjzA@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] media: qcom: camss: Take the link frequency from
 the CSI-2 transmitter
To: Hitesh Patel <hitesh@ebytelogic.com>
Cc: linux-media@vger.kernel.org,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        ravi@ebytelogic.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzMiBTYWx0ZWRfX8PWfXVsibNe+
 R5a9EIY1KizJXbTDuHZdccR/sPbNM+XUX9ADxj7dxehqQ/ZJCgKHy81W/jcCEYIhYYHdEjjnKqz
 owYIo5e7CsD05I17/zB8CyNtGItPFnclgaaavU/jHNbbX4mX8+EanjrYQIKkcSDrqk4SxMgi9nw
 XPMFStOI9izuROZiLlGUFUtw3GdoBIXiLRHmscoOWmkmzZ9U9buXkD47Vkl8J1Vrb700L96pWF9
 Jmeo/OX0CKci+P3i2ZR/sQir9AVH1p6v2KJ6pR6XgL5Dtbr6oDPVQbHWznb1GNNVz8CtVf57YtN
 7V/QAH6394rDRAxih7t4zqh/wT8YaZuwiYutb8/E+LUfBJ3cNtE3MITdSN0Zo3GljOz4czy2Xm4
 4+m7+nRIPccatyzYpOWp31YILCae/GbUQFWO3KCq3TGzMTlqTWyZ0DrtjRnQCwbMUV1EIhCOnCI
 c51E91tPOo70gSxojnQ==
X-Authority-Analysis: v=2.4 cv=V8foQuni c=1 sm=1 tr=0 ts=6aba2012 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=ZovgdgjKAAAA:8 a=kD2hMPwKAu5PM3DgiqcA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=VOxKbm1zgHvARWIDjr3b:22
X-Proofpoint-ORIG-GUID: hpQmtq7P-s1OWi0fK0jj5R-bV2a_r-WY
X-Proofpoint-GUID: hpQmtq7P-s1OWi0fK0jj5R-bV2a_r-WY
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzMiBTYWx0ZWRfXwQqOE1C7A1sb
 6dKiGrb4hT4Ye6cOkr08zKErlIFqyuoy1t/7wL5YZdWt7C0lXsZF7cjSLI4G4eOLeGu17BxsC90
 DDwUgF99ok9oRBKwoGJL1bq0n3jOFjw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280032

On Mon, Sep 28, 2026 at 8:44=E2=80=AFAM Hitesh Patel <hitesh@ebytelogic.com=
> wrote:
>
> camss_get_link_freq() walks the pipeline up to an entity with the
> MEDIA_ENT_F_CAM_SENSOR function and reads the link frequency there.
> The CSIPHY settle count and the CSID clock are then derived from it.
>
> The frequency the receiver has to be programmed for is the one on the
> CSI-2 bus, which belongs to whatever drives that bus. When the sensor
> is wired straight to the CSIPHY that is the sensor, and the walk gives
> the right answer. When a CSI-2 to CSI-2 bridge sits in between, such
> as a GMSL or FPD-Link deserializer, the bridge re-times the data onto
> its own output at its own rate: it may aggregate several sensors onto
> one link, forward one sensor at a different rate, or generate a test
> pattern with no sensor at all. The sensor's rate is then not what
> arrives at the SoC, and the CSIPHY does not lock.
>
> The walk can also fail before reaching a sensor. A deserializer has
> one sink pad per serial link and the walk always follows pad 0; a
> sensor attached to any other link is never found and streaming is
> refused with "Cannot get CSI2 transmitter's link frequency".
>
> Stop the walk at the first entity that is not a CAMSS receiver, i.e.
> at the external subdev feeding the CSIPHY, and ask that pad with
> v4l2_get_link_freq(). The helper queries the transmitter through
> .get_mbus_config first and falls back to its V4L2_CID_LINK_FREQ and
> V4L2_CID_PIXEL_RATE controls, so a bridge and a bare sensor are both
> handled by the standard mechanism.
>
> For a sensor connected directly to a CSIPHY the transmitter is the
> sensor, so the pad found and the value returned do not change.
> camss_find_sensor_pad() is kept for camss_get_pixel_clock() and the
> frame skip query, which do want the sensor.
>
> Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
> ---
>  drivers/media/platform/qcom/camss/camss.c | 70 +++++++++++++++++++++--
>  1 file changed, 64 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 23f3cc30a1..327ac7b280 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4619,24 +4619,82 @@ struct media_pad *camss_find_sensor_pad(struct me=
dia_entity *entity)
>         }
>  }
>
> +/*
> + * camss_is_receiver_subdev - Test whether a subdev is a CAMSS CSI-2 rec=
eiver
> + * @camss: CAMSS device
> + * @sd: Subdevice to test
> + *
> + * Return true for a CSIPHY or CSID belonging to @camss, false for anyth=
ing
> + * else, in particular for the external subdev transmitting to them.
> + */
> +static bool camss_is_receiver_subdev(struct camss *camss,
> +                                    struct v4l2_subdev *sd)
> +{
> +       unsigned int i;
> +
> +       for (i =3D 0; i < camss->res->csiphy_num; i++)
> +               if (sd =3D=3D &camss->csiphy[i].subdev)
> +                       return true;
> +
> +       for (i =3D 0; i < camss->res->csid_num; i++)
> +               if (sd =3D=3D &camss->csid[i].subdev)
> +                       return true;
> +
> +       return false;
> +}
> +
> +/*
> + * camss_find_transmitter_pad - Find the pad of the CSI-2 transmitter
> + * @entity: Media entity in the current pipeline
> + *
> + * Walk the pipeline upstream through the CAMSS receiver subdevs and ret=
urn the
> + * source pad of the first entity that is not one of them: the CSI-2
> + * transmitter driving the SoC.
> + *
> + * Return a pointer to the transmitter media pad or NULL if not found
> + */
> +static struct media_pad *camss_find_transmitter_pad(struct media_entity =
*entity)
> +{
> +       struct camss *camss =3D container_of(entity->graph_obj.mdev,
> +                                          struct camss, media_dev);
> +       struct v4l2_subdev *sd;
> +       struct media_pad *pad;
> +
> +       while (1) {
> +               pad =3D &entity->pads[0];
> +               if (!(pad->flags & MEDIA_PAD_FL_SINK))
> +                       return NULL;
> +
> +               pad =3D media_pad_remote_pad_first(pad);
> +               if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
> +                       return NULL;
> +
> +               entity =3D pad->entity;
> +               sd =3D media_entity_to_v4l2_subdev(entity);
> +
> +               if (!camss_is_receiver_subdev(camss, sd))
> +                       return pad;
> +       }
> +}
> +
>  /**
> - * camss_get_link_freq - Get link frequency from sensor
> + * camss_get_link_freq - Get link frequency from the CSI-2 transmitter
>   * @entity: Media entity in the current pipeline
>   * @bpp: Number of bits per pixel for the current format
> - * @lanes: Number of lanes in the link to the sensor
> + * @lanes: Number of lanes in the link to the transmitter
>   *
>   * Return link frequency on success or a negative error code otherwise
>   */
>  s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
>                         unsigned int lanes)
>  {
> -       struct media_pad *sensor_pad;
> +       struct media_pad *tx_pad;
>
> -       sensor_pad =3D camss_find_sensor_pad(entity);
> -       if (!sensor_pad)
> +       tx_pad =3D camss_find_transmitter_pad(entity);
> +       if (!tx_pad)
>                 return -ENODEV;
>
> -       return v4l2_get_link_freq(sensor_pad, bpp, 2 * lanes);
> +       return v4l2_get_link_freq(tx_pad, bpp, 2 * lanes);
>  }
>
>  /*
> --

I think we could even simply replacing/refactoring
camss_find_sensor_pad() with camss_find_transmitter_pad()?
