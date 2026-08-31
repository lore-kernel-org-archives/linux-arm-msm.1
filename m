Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1718B494828
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 14:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788185438; cv=none; b=Ew6doNGLydsab2rFXVf4cXZzwCZOy77NRUF8Vm15xJHGfvLuAIg69m/MP9/huvXUZ14ZTXUKC9CunR9k6TKJaYqt4MWz+XKhEzeQ17FfTlq+W6M7PKYgTqyweXKbnyekrkhKlkzBz8Oqnok7yk1eHgVUVihS84kkaXZwpjuayq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788185438; c=relaxed/simple;
	bh=s/eJq3AC+D6A4TkhQtv3jZ3s2XvL1jfXt0xs+Kf1ZfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N7LwGFWLo3dSPhHkm3WtveYk4Xg+uOlr7latiqGKt5DpWSr2IgsjRaPcp0abr9jURyEPMoEr2fc9SaCKsA/WbNh0LO8Ngs6Nr73vOCuJP6HCaQsQzlVdIkbrJX4sy/ND9srzJB6S/VEVdA9hfdZM5fkqAFEEuls8uwHfidujvCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kp/3d/hy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b9bMMWzj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kp/3d/hy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b9bMMWzj"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VBA0Up3447162
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 14:10:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iVFh2LW5L1fu6esOaKgWGlZN
	A5ALr/AG5W+DG3xXBV4=; b=kp/3d/hyBVmPOO7zUXu6ZMkJIT2fQxXY6ESAiLYm
	n+bu2h3deIJLw258/8JFru5bAgTCUq75+k7SuGnDt/bvpJ+QD3Q4NAk7jvbGDwh8
	9Hwd18OLIp4lzkQz3/Kfe/RDfnS60OEYlSkZA8AJy0XVV9rHRNN/bCTzlgjdTblI
	8FPFyh5MiRhd4o7RostPozRjSJYlf+8h2dg42L/hJ9ywAkSC862Gv4HEovoQoNN2
	mMxHBBeUzVRlDoybh/fC+uMTHU/K78FFf8WkPL4SpA5p8RlInqyPEymN9pSRV3QF
	I40H+3YY0odD/+C086Q4pN1lVEvyi82uAGLn1GI4VIVO8Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6rb9699-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 14:10:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9308eafb465so886925885a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 07:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788185435; x=1788790235; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iVFh2LW5L1fu6esOaKgWGlZNA5ALr/AG5W+DG3xXBV4=;
        b=b9bMMWzjV0CyEMu/xrESXmIyQzGq29wCcjyNXVycfixlrSO7PZamQoj6LIg1j9SmTP
         bNn5iCSValxx6hSLV3PUS/07nxShV7CJRqfKD5lZF1gW9MFSRPYAqpKYJ1tvHtnQIGSm
         9Mmghg0iElbJXJz1pOk+ENI3AKsvHyUJUIPGWYtwXYGjGywsE3wC7au4b5RZrczDIZ68
         hJTGU1gOWE3jLjGt3Th/FqRJoRPbosGjGQzVzJ3Pt9C9dNPEH+gTVDwvTNomNEGgySIV
         1wE0ghxoSaQIepC+qlZdfhUhhti+2LukCc/gQUBfH1cZR7H7LmPBhq2sjQS1CPM0VNdj
         dghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788185435; x=1788790235;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iVFh2LW5L1fu6esOaKgWGlZNA5ALr/AG5W+DG3xXBV4=;
        b=rn405NMlcbWc7iyL+rQxZyv0FxJCUjvFKyp3oW/8EkowDWG1NMk4NS63RdQhwyrx2G
         x+DMHBWSSCFgkYd3oA+OF/BYalVk24msH+dpVElCUy8utZuV3weuQ6AyNWZLVLDuXrWy
         LDhi2WybMjeSHAv/vAmHmUjvSKxaWCHzlI3jVAU9u33KWjY4VJYsiDW8pgx/rRM78ojh
         Y2ftLzCxlovozz4AfuxftUmm3oDk/xdddRyjs5B7YDs051pwX5LVKW8YbjF7c+iWdku/
         eXeoeghcj8IEqZRXKeaMkwP2c9WRM1O4Y4QpQQ17ALByPoh1gyY1ad5zIXuTwNG4Byt0
         D/Fg==
X-Forwarded-Encrypted: i=1; AHgh+Rq4tfj+7abh8OkMbKIK4o+VwgicSbSmtIJ3BDRN5C6MVTCsNEgZFpQuycgo8T/sSFkQ+5jaTokswpW8Xdg8@vger.kernel.org
X-Gm-Message-State: AFuF++na0wgX5KP3ALdDUQwrwC4mcrThQuvAKaDiqGI5L0JvBXZleenk
	7vtM58h7ZXr0KTQtbUSYjwPa0aQkADVBJipVayxH5Vx45YSaa01aHaeCrm/ogddCF7RpUsr/JGt
	gxvNkOjgO+ujVINxOhrYdIx23LwwQMfPNJF5AF+9NPkICJkljvbk9rC9Jutk+3Kyfi5sW
X-Gm-Gg: AR+sD12JiJ05wR5SYJXl+TXkRu2z0SGptiuy/FATiI9RaaEiFr1CKMFAah4cM//Yl9i
	NhcrCyNHAEQyl0YH0qeEcMywl8oyd0g+ZzxvoOC1gjJxyNC06ybSbY4/lNcRQ/4I1/whpCWHxxR
	S+M7iYq6EAFRFPSNCzmflPm0PSPPwl25iy9Iac+p1lDw4XLbUJqDZoaycNSwTgUOeMWpNWeLZHu
	PMSV6qx8W3EBzNHbwv/6aQhWsqoA7tK5nDYnja2F9RFRHJ0XszZchLZQaOjEMzsmQG+Hic7lh7q
	ChTUJB/+W25PJeIclpGHmqAxPrljtD9G5R5yaB8gURDkuc9+yVNR5czcSQzVN6OKpbbV4mfKbqk
	Iizgvkgw7QrmL
X-Received: by 2002:a05:620a:710e:b0:92e:ef09:f8f3 with SMTP id af79cd13be357-93913783b9fmr3153279185a.2.1788185432574;
        Mon, 31 Aug 2026 07:10:32 -0700 (PDT)
X-Received: by 2002:a05:620a:710e:b0:92e:ef09:f8f3 with SMTP id af79cd13be357-93913783b9fmr3153210285a.2.1788185429688;
        Mon, 31 Aug 2026 07:10:29 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4942298fsm388336305e9.1.2026.08.31.07.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:10:28 -0700 (PDT)
Date: Mon, 31 Aug 2026 17:10:26 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: Sort Nord clock driver entries in Kconfig
Message-ID: <xsjednoivela3axky2rnblvumqbp5x2p7szfrh7km5iq4mysup@mslleonjlyzt>
References: <20260831134717.510383-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831134717.510383-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: NkrJCm3uFz3rqk-xIlBb-S6R2otzEIMS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEyMiBTYWx0ZWRfX58oJp4kjD6N/
 oFBv8AZXFHy4ffN3mpizaGWJm57XALGByTS0TOtS54xSkjV2j5+4iTKvrJ/3Z1xGZXK94J4xPwV
 E9+VdLBNkmKzqoABQd9SLbon+utDFRqJT8AMTAbZZ9eyReED2Rg5kFOUCAu52+CPmG8t1B+U/eN
 6g2B7CWcswFaTgzBEi+f60qboi3RInp984ZKM5yJikRVfnLNZhHKZmVv6q+p8d1Ghn8elBM8D5D
 IDscxCN8pZ3DjDqVpr9m/9oHyfRwoXbGs4brMOFRYP6OQX1jPz049MLBtD3E7IlfPJ1e1I8pb7s
 EPQqx5W1fR8SYs1ihwqW0GH1xhNwKxq41FzM5APJJntS0QP1r81U8RTHcttCXHGBu4IKIp0/Dkw
 5dEpCFCcEQdG+lcAFKhOOOEll5R0p3r67xcMOWZ5AmHsEYrgyRg0r/9eYMJOoi7ii0/nGYdBl/g
 FA1dtI2DGjZrc7o5kPw==
X-Proofpoint-GUID: NkrJCm3uFz3rqk-xIlBb-S6R2otzEIMS
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEyMiBTYWx0ZWRfX4qY//B74yOR0
 g1q2bUeiNB7fvp8GVetDcZraJD3q5QXGlcIgRz7IlChJPQOVyHrvldNIAtjyhsSL3EHnZ9LJAMl
 ItfoEEXGsPvIdpnKk/mVr2H3W/9R4lk=
X-Authority-Analysis: v=2.4 cv=d/fFDxjE c=1 sm=1 tr=0 ts=6a958b5c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=GoVAX4XHNZ9XBqBwuDoA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 spamscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310122

On 26-08-31 21:47:17, Shawn Guo wrote:
> The Nord clock driver entries in Kconfig were out of alphabetical order.
> Reorder these symbols so Kconfig follows the same order as Makefile,
> making it easier to locate and add entries consistently.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
