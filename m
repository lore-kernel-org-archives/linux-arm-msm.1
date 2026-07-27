Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A802B38A715
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 15:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785165301; cv=none; b=MAkvR5hXENK9ty4ISwTKjP0YP7VDlqXiuWzPuXa771/WoYYS/R+NH3D2+kpXrpMTwwaH1EobAdsJLs0QiR2RjrVp9Z1C8jfvJ6AV/NPWrvHcWPt9fI6AY7tk9TbsXiXJ/jjhs65lb6Z+5SnXMQyBr2hiBQTuMrxOe1hrXOy31sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785165301; c=relaxed/simple;
	bh=Uao1ESegqYmJ+9aM9oj5spEjW5IoVQK+A7wzpCd0HTY=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=BI2bgIwNHobLGlz6/B+hmMetDCpBmKutEiTGi690t33jjvSqHdVt4O5ttnOjpXlHFChBvPBztqgK9SfeszvN3HmRimKD6ITJwsChJo+GvRHspZSerGaCtkwo6bOvxh8Znj8HfuTGPWGZms9hcv2K5Wb9ylwB1+jNyiNdsv6rcgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=CkXuAXG+; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="CkXuAXG+"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47f96c5b722so1618786f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 08:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785165297; x=1785770097; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BlUyitrTssuExmqn+vHy6/bIQVdsvbTuWt21w/R2Ncw=;
        b=CkXuAXG+el2TitKNIiqL7lRCmUyUQurelNKf2G+m4wBDdJKuU2Of9G9dAxV7TziVSM
         SGUrA3i2kWNC9TV2qVk2ksfNIliPZ50SB7vVrZApCfAK81MuW+zKwo7xWZZ9d6DGZQl1
         6Sp4jcsgy7GYc4PeV9IUaRwNowY3Bi4E2QY6A2nlbPDgRfrrZ/SZFH3gLUbsBDOz+X8v
         jGeMbm0RoydjCtPsUGx548fhJfBCjJImbmp9spsXDpfhhW9qp41WC8mlEXORkNNBOddd
         TOceW4g7837ydSOA9cYeXiVKKZZ0kkrgjwBFwC7IGv9qVEcvRCmZfenhGosLvoy/zkkF
         HxFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785165297; x=1785770097;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BlUyitrTssuExmqn+vHy6/bIQVdsvbTuWt21w/R2Ncw=;
        b=nK8MSxoBTni4D/d8Y69inWvIYKJCl3yQKl8xjCdHf2HD4MpvCH03UeYQsbWDlJKN3R
         D1Vj+qF2dKaft4BHZd/83yezfCaU5FkR+15Whed0VODVOEwoKmgoR3sX8B8APv8ZZ+bA
         3QARECrIMYWfsfLBOZjw2i8bVBd2NTr9RDCUS9w+fo7UV3Uje7SUxVsXKFdyz9TjPZi1
         OJCttLWO1MN/cHE/fmvZq0Ehz6wsajnuTdLXOkgcMMXFVwaxGyXdq6v90deaRdTgArwD
         e6kyGYfvrhM6ZQ7YuEMdsjOx1uqWATj8/TugfvPPK5CcTtOnz9GTWfuzsUYWB2fDu0cC
         iPeg==
X-Forwarded-Encrypted: i=1; AHgh+RqRcR2/dynY2c0m0p/PuD6IvWO5xHE/VsxZpjKrkmuMZL9UK6YhduSX3L4YRGkwHiJxn1t0XpfDt8Up50KD@vger.kernel.org
X-Gm-Message-State: AOJu0YxS+nDpEioMd4Wx/ze5CgeV5JPNQYW7JMfEwr+xi/acstwKgkdz
	PoKqhGyaJc3+22PwR8vl8tdOvywZM91QonzvDCmNQPWjCrIXzDQnzXqXPdlW0HZep74=
X-Gm-Gg: AR+sD132LfUD5+q6l+yRdZjIHxeDvaDyAr2OpAoxFsyn3u7jKyWe1ZxR+gYKPS7wDQp
	6dG1cfraGpyxsXR7MbtERnHfKLQm5cI7NSjkcnZ8dAuOt0xc6RfMQUf/Youmaq/GOPAxssvXqI0
	gaIlMcbzieP9Vu6aZDLta29a5Tf2J9VNGFaTJDE7iDzlPOBim8B9x9pzS8dz2jj5ZbFtHHRNNzT
	/2tMouJKAe0zcnQ5nOHrC8PXR+pBl0FDe2oLH6qUF/0zH/YQ6WgudiVWXwBdRFKHNWN4AXit4Ro
	cRORVQDa6cvNEH6IKdM419FiqVOX95ivy1P+N3A6aTpdEKPxDU9LFEa0dvjwO2YPyerm/ZldwX9
	A+W8enjziHBzv9AqQiY6/5IqNNsqzfClyAopoir0dYOznimSVRktEwM59IP8Q8TLFCS0tdjYOZ3
	5gUukp3ieJ97Gik1smr+DEWfM7wICocLJx6eQgY+okmKYw6CKSO+gp
X-Received: by 2002:a05:6000:46c8:b0:47f:9738:9d89 with SMTP id ffacd0b85a97d-47f9fea580amr7665530f8f.34.1785165296886;
        Mon, 27 Jul 2026 08:14:56 -0700 (PDT)
Received: from [192.168.5.218] (88-127-185-231.subs.proxad.net. [88.127.185.231])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f85c531basm54606155f8f.19.2026.07.27.08.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 08:14:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 4/6] clk: qcom: Add Nord display clock controller
 support
From: Alexandre Mergnat <amergnat@baylibre.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Ajit Pandey <ajit.pandey@oss.qualcomm.com>, 
 Imran Shaik <imran.shaik@oss.qualcomm.com>, 
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260724-nords_mm_v1-v3-4-32b45232217f@oss.qualcomm.com>
References: <20260724-nords_mm_v1-v3-0-32b45232217f@oss.qualcomm.com>
 <20260724-nords_mm_v1-v3-4-32b45232217f@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 17:14:48 +0200
Message-Id: <178516528803.342148.5281819223862501356.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=436; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=Uao1ESegqYmJ+9aM9oj5spEjW5IoVQK+A7wzpCd0HTY=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBqZ3XrIdWIowJKnP81MovI673qJoNb2T5FgIKi5
 3PbGYoY6yOJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCamd16wAKCRArRkmdfjHU
 RfhmD/9yI8nsDThCDixO/VFr43kta5mXbufbDnntSeXhbLIEZ7ee893RAsGArnOZs7l9gWZU8bS
 a5qSGIC8NCa0+6D/pfBGTgUvvAd+/UFLzV5zx/0ZwnwP6xcokuWBKMCt4VJ/KXkFp3zWu98xrNj
 kHe+uldHSARbWLvl6Cu/q5ApNOUQkm9zdGGEpQDPMVx0PP7CZRFpNk/IEHV6NFykC+ouTw9LqF7
 hZmYGTiiausry8UiyQKuUE6Vj93rPblsUQ30VDHtX06FA93MM9YRDwzANVUTVMmC3mj+APEUEMq
 EIIixiTKOSidbVtgJSF/SIa6b23/Ei+263PUriOcSXi7s7OWo9V4ssMpuR7BkVfZabunvkGUsyy
 B3dZd/G/gqdOyr1a/sXTUSGS1gSv7vYvpJKfwQl9/8WqWrd1G4Be7ZgGAMYjRJy6A3LrtPY8Nrz
 Zr64lDeAXU6slSh8AQywHAP31/TdLehgomw6T4BmwcqCRhujQAeTVPU/do65doDUKocqujQRZfC
 8ipaIE5AeJafhlsrMUtRluhTlQalFA0uGjJL0dOxKeF4AT1YP+ycCEITJAxbpYDW5PP52UGwSKQ
 dGALNI/jRLR7VCguCCGNAYo2QQzw58LuO/Cf8P+Qg4a2Ww/fYWYZ3Yl/UqjY1OVeU07ElNOdWd7
 vnI+8Fdr7kHll4w==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

On Fri, 24 Jul 2026 16:25:08 +0530, Taniya Das <taniya.das@oss.qualcomm.com> wrote:
> Add support for the display clock controllers (DISPCC) on the
> Qualcomm Nord platform.
> 
> The platform includes two display clock controller instances,
> display0 and display1. Register support for both controllers.
> 
> 
> [...]

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Alexandre Mergnat <amergnat@baylibre.com>
